#!/bin/sh
#Storing inputs
inputfile=$1
outputfile=$3
#Adding _header.html and _footer.html to input 2 accordingly and storing them in variables
header=$2_header.html
footer=$2_footer.html

#combines the header, inputfile, footer and outputs into outputfile
cat $header $inputfile $footer > $outputfile
