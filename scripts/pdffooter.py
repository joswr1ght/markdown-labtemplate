#!/usr/bin/env python3
import pdb
import sys
from fpdf import FPDF
from PyPDF2 import PdfFileReader

FONTPATH="/Users/jwright/Library/Fonts/OpenSans-Regular.ttf"
footerstr=""

class PDF(FPDF):
    def footer(self):
        # Position at 2.05 cm from bottom, matching page number location
        self.set_y(-20.50)
        # Arial italic 8
        self.set_font('OpenSans', '', 8)
        self.set_text_color(126, 126, 126)
        # Page number
        self.cell(0, 10, footerstr, 0, 0, 'C')

if __name__ == "__main__":
    if (len(sys.argv) != 4):
        pdb.set_trace()
        print("Usage: %s [InPDF] [Footer String] [OutPDF]"%sys.argv[0])
        print("\nThis script is non-destructive to the input PDF; it is only used for a page count indicator.\n")
        sys.exit(1)

    # Get page count 
    try:
        pdf = PdfFileReader(open(sys.argv[1],'rb'))
    except:
        sys.stderr.write("Error opening file %s\n"%sys.argv[1])
        sys.exit(1)
    pagecount=pdf.getNumPages()

    #pdf=PDF("Footer String")
    footerstr=sys.argv[2]
    pdf=PDF()
    pdf.add_font('OpenSans', '', FONTPATH, uni=True)

    for i in range(0, pagecount):
        pdf.add_page()

    pdf.output(sys.argv[3],'F')
