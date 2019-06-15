#!/bin/bash

cmdexists() {
    if [ $(type -P $1) ]; then
        return 0
    fi
    return 1
}


REQUIREDUTILS="pandoc bash python3 puppeteer-pdf pdftk awk grep sed"
for util in $REQUIREDUTILS; do
    if ! cmdexists $util; then
        echo "The utility $util is not available. Please install before using this script."
        exit 1
    fi
done

if [ "$1" == "check" ] || [ $# -gt 1 ]; then
    echo "Required utilities are installed."
    exit
fi

if [ ! -f "publish.sh" ] ; then
    echo "Please run ./publish.sh from the main repo directory."
    exit
fi

echo Generating wiki content for online viewing
rm -fr wiki ; mkdir wiki
cp -r content/pics content/css content/js content/fonts wiki

cd content
for i in *.md; do
    TITLE=`basename $i .md | sed 's/_/ /g'`
    pandoc -f gfm --ascii -t html --template wiki-template.html  --metadata pagetitle="$TITLE" "$i" -o "../wiki/${i%.*}.html" 
done

cd ../wiki
TOTAL=$(ls *.html | wc -l)
COUNTER=1

#Open every newly created HTML file
for i in *.html ; do
        printf "HTML Post-processing    ...................................     $COUNTER/$TOTAL\r"
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
        (( COUNTER += 1 ))
done
echo
cd ..


if [ "$1" == "noprint" ] || [ $# -gt 1 ]; then
    echo "Skipping print file production."
    exit
fi

echo Generating wiki content for print
rm -fr print ; mkdir print
cp -r content/pics content/css content/js content/fonts print
echo -e "@import url(./print.css);\n$(cat print/css/main.css)" > print/css/main.css

cd content
for i in *.md; do
    if [ "$i" == "_Sidebar.md" ] ; then 
        continue
    fi

    TITLE=`basename $i .md | sed 's/_/ /g'`
    pandoc -f gfm --ascii -t html --template print-template.html  --metadata pagetitle="$TITLE" "$i" -o "../print/${i%.*}.html" 
done

cd ../print
TOTAL=$(ls *.html | wc -l)
COUNTER=1

#Open every newly created HTML file
for i in *.html ; do
        printf "HTML Post-processing    ...................................     $COUNTER/$TOTAL\r"
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
        (( COUNTER += 1 ))
done
echo


# This grep/sed is weak sauce but I'm getting annoyed. TOFIX. JLW
# Get the order of lab exercises by file name
ORDER=`grep '<li>' ../content/wiki-template.html | grep href | grep -v twitter | sed 's/.*="// ; s/".*// ; s/\.html//'`

### Convert HTML files to PDF
echo "Generating PDF files using Puppeteer"
python3 -m http.server --bind 127.0.0.1 8000 >/dev/null 2>&1 &
SERVPID=$!
for lab in $ORDER; do
     puppeteer-pdf "http://127.0.0.1:8000/$lab.html" --path $lab.pdf
done
kill $SERVPID

PDFFILES=`echo $ORDER | sed 's/ /.pdf /g'`".pdf"

echo Combining Lab PDF Files
pdftk $PDFFILES cat output ../Workbook.pdf

