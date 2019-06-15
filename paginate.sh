#!/bin/sh
echo "Paginating Workbook.pdf"
if [ ! -f "paginate.sh" ] ; then
    echo "Please run ./paginate.sh from the main repo directory."
    exit
fi


# we'll hide the work in a temporary directory
mkdir tmp_num
cp content/pdfassist/page-numbers.pdf tmp_num/.
cp Workbook.pdf tmp_num/.
cd tmp_num/

# burst Workbook into its component pages and extract total pages
pdftk Workbook.pdf burst output book_%04d.pdf 
cat doc_data.txt | grep NumberOfPages > nu_pages.txt
nu_pages=`awk '{print $2}' nu_pages.txt`

# burst the page number file into its component pages
pdftk page-numbers.pdf burst output nums_%04d.pdf 

# no page number on the first page
#cp book_0001.pdf fin_0001.pdf

x=1 # initialize x

# place the page numbers on each page of Workbook
while [ "$x" -le "$nu_pages" ]; do

    if [ "$x" -lt 10 ]; then
        pdftk book_000"$x".pdf background nums_000"$x".pdf output fin_000"$x".pdf
        #echo "Finished page $x of $nu_pages."
        x=$(($x+1))

    elif [ "$x" -lt 100 ]; then
        pdftk book_00"$x".pdf background nums_00"$x".pdf output fin_00"$x".pdf
        #echo "Finished page $x of $nu_pages."
        x=$(($x+1))

    elif [ "$x" -lt 1000 ]; then
        pdftk book_0"$x".pdf background nums_0"$x".pdf output fin_0"$x".pdf
        #echo "Finished page $x of $nu_pages."
        x=$(($x+1))
    fi
    /bin/echo -n .
done
echo


# create the new PDF file and move it to the original directory
pdftk  fin_*.pdf cat output ../Workbook-paginated.pdf
rm -fr ../tmp_num

echo "Done: Workbook-paginated.pdf"
