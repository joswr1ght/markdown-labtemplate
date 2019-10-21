#!/bin/bash

getlaborder() {
    grep -v '^#' ../lab-order.txt | paste -s -d ' ' - | sed 's/\.md /\.html /g;s/\.md$/\.html/' 
}

cmdexists() {
    if [ $(type -P $1) ]; then
        return 0
    fi
    return 1
}

if [ -z "$LABLANG" ] ; then
    #LANGUAGES="en jp"
    LANGUAGES="en"
else
    LANGUAGES=$LABLANG
fi

REQUIREDUTILS="pandoc bash python3 puppeteer-pdf pdftk awk grep sed"
for util in $REQUIREDUTILS; do
    if ! cmdexists $util; then
        echo "The utility $util is not available. Please install before using this script."
        exit 1
    fi
done

if [ "$1" == "check" ] ; then
    echo "Required utilities are installed."
    exit
fi

if [ ! -f "publish.sh" ] ; then
    echo "Please run ./publish.sh from the main repo directory."
    exit
fi

#Test trhat pandoc version supports gfm
PDFMT=$(pandoc --list-input-formats | grep gfm)
#If gfm isnt supported, use markdown_github
[[ ! -z "$PDFMT" ]] || PDFMT="markdown_github"

if [ ! -d "wiki" ] ; then
    mkdir wiki
else
    rm -fr wiki/*
fi
cp -r content/index.html content/css content/js content/fonts content/videos wiki

cd content
for lang in $LANGUAGES; do
    echo "Generating HTML content ($lang)"
    cd $lang
    mkdir ../../wiki/$lang
    for i in *.md; do
        TITLE=`grep -Em1 "^# .*" $i | sed 's/# //'`
        pandoc -f $PDFMT --ascii -t html --template ../wiki-template.html --metadata pagetitle="$TITLE" "$i" -o "../../wiki/$lang/${i%.*}.html" 
        # Copy the English-language pics in, then overwrite with any language-specific pics
    done
    cp -r ../en/pics ../../wiki/$lang
    cp -r ../en/extra ../../wiki/$lang
    if [ $lang != "en" ] ; then
        cp -r pics ../../wiki/$lang
        cp -r extra ../../wiki/$lang
    fi
    cd ..
done
cd ..

for lang in $LANGUAGES; do
    echo "Generating search index ($lang)"
    ./scripts/buildidx.py content/$lang wiki/$lang/lunr.json
done

# The default markdown file in Home.md, used for creating the title in the HTML output.
# To make the Home.md -> Home.html file the default for the page, it is renamed to index.html
cd wiki

#Open every newly created HTML file
for i in */*.html ; do
    awk '
        /<img src=/,/\/p>/       {firstinsert=index($0, " src=");
        secondinsert=index($0, " alt=");
        print substr($0, 1, firstinsert)  " class=\"myImg\" " substr($0, firstinsert, secondinsert-firstinsert) " style=\"width:100%;max-width:600px\" " substr($0, secondinsert, length($0)-secondinsert+1);
                                        next;}
                {print $0;}
        ' $i > $i.bak
    mv "$i.bak" "$i"
    # Fixup markdown href's to point to HTML files
    sed 's/.md"/.html"/g' $i > $i.bak
    mv "$i.bak" "$i"
done
cd ..

# If the first argument is noprint, then skip print file production. Alternatively
# arguments can be used to specify languages to produce.
if [ "$1" == "noprint" ] || [ $# -gt 1 ]; then
    echo "Skipping print file production."
    exit
fi

###
### Handling Print Generation Below
###

for lang in $LANGUAGES; do
    echo -n "Generating print content ($lang): "
    rm -fr print ; mkdir print
    cp -r content/css content/js content/fonts content/en/pics content/videos print
    if [ $lang != "en" ] ; then
        cp -r content/$lang/pics print
    fi
    echo -e "@import url(./print.css);\n$(cat print/css/main.css)" > print/css/main.css

    cd content/$lang
    for i in *.md; do
        TITLE=`basename $i .md | sed 's/_/ /g'`
        pandoc -f $PDFMT --ascii -t html --template ../print-template.html  --metadata pagetitle="$TITLE" "$i" -o "../../print/${i%.*}.html" 
    done

    cd ../../print

    # Open every newly created HTML file
    for i in *.html ; do
            awk '
            /<img src=/,/\/p>/       {firstinsert=index($0, " src=");
            secondinsert=index($0, " alt=");
            print substr($0, 1, firstinsert)  " class=\"myImg\" " substr($0, firstinsert, secondinsert-firstinsert) " style=\"width:100%;max-width:600px\" " substr($0, secondinsert, length($0)-secondinsert+1);
                                            next;}
                    {print $0;}
            ' $i > $i.bak
            mv "$i.bak" "$i"
            # Fixup markdown href's to point to HTML files. sed -i is inconsistent on macOS and Linux so we `mv`
            sed 's/.md"/.html"/g' $i > $i.bak
            mv "$i.bak" "$i"
            sed 's|<p><a id=".*">&nbsp;</a></p>||' $i > $i.bak # Remove anchors
            mv "$i.bak" "$i"
    done

    # Get the order of lab exercises by file name
    TOTAL=$(ls *.html | wc -l)
    COUNTER=1
    ORDER=$(getlaborder)

    ### Convert HTML files to PDF
    python3 -m http.server --bind 127.0.0.1 8999 >/dev/null 2>&1 &
    SERVPID=$!
    for lab in $ORDER; do
        echo -n "."
        puppeteer-pdf "http://127.0.0.1:8999/$lab" --path $lab.pdf
    done
    echo
    kill $SERVPID >/dev/null 2>&1
    wait $SERVPID 2>/dev/null

    PDFFILES=`echo $ORDER | sed 's/ /.pdf /g'`".pdf"

    # Combining Lab PDF Files
    pdftk $PDFFILES cat output ../Workbook-$lang.pdf

    cd .. # Back to content/

done
