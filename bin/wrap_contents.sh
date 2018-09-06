#!/bin/sh
inputfile=$1
outputfile=$3
header=$2_header.html
footer=$2_footer.html

cat $header $inputfile $footer > $outputfile
