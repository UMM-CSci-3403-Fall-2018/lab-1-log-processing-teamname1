#!/bin/bash
#storing the starting location
here=$(pwd)

#cd into the desired directory
cd $1

#this combines all of the failed_login_data.txt files into one temp file 
cat ./*/failed_login_data.txt > temp0.txt

#this sed takes all the names in temp0.txt, ignoring the rest of the data, sorts it, counts each name using uniq and puts it into temp.txt
sed -nr "s/([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([^[:space:]]+)/\4/gp" < temp0.txt | sort | uniq -c > temp.txt

#this sed parses the count and names from temp.txt, putting them in the desired format, and puts them in temp1.html
sed -nr "s/([[:space:]]*)([[:alnum:]]+) ([[:alnum:]]+)/data.addRow(['\3', \2]);/gp" < temp.txt > temp1.html

#combines username_dist_header.html, the temp file with all of our formatted data, and username_dist_footer.html
cat $here/html_components/username_dist_header.html temp1.html $here/html_components/username_dist_footer.html > username_dist.html

#deletes temp files
rm temp1.html
rm temp.txt
rm temp0.txt

#Note: Sed can only take files as an input. It will fail if raw text is given to it.
#This means we have to create temp files to store text for the next sed.
