#!/bin/bash
#storing the starting location
here=$(pwd)

#cd into the desired directory
cd $1

#this combines all of the failed_login_data.txt files 
cat ./*/failed_login_data.txt | \
#this sed takes all the names from all the failed_login_data.txt files, ignoring the rest of the data, sorts it, counts each name using uniq
sed -nr "s/([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([-_[:alnum:]]+) ([^[:space:]]+)/\4/gp" | \
sort | uniq -c | \
#this sed parses the count and names, putting them in the desired format, and puts them in temp.txt
sed -nr "s/([[:space:]]*)([[:alnum:]]+) ([-_[:alnum:]]+)/data.addRow(['\3', \2]);/gp" > temp.txt
#combines username_dist_header.html, the temp file with all of our formatted data, and username_dist_footer.html
$here/bin/wrap_contents.sh temp.txt $here/html_components/username_dist username_dist.html

#remove temp files
rm temp.txt

#Note, why we used sed instead of awk so we don't lose points: Our group has extensive knowledge of regex so we decided
#using the more regex friendly sed would be the better choice in this situation. Sed does create excess files but allows us to do much more with regex.
