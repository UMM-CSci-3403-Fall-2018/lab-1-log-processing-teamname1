#!/bin/bash
here=$(pwd)
cd $1
cat * > temp0.txt
sed -nr "s/([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([^[:space:]]+)/\4/gp" < temp0.txt | sort | uniq -c > temp.txt
sed -nr "s/([[:space:]]*)([[:alnum:]]+) ([[:alnum:]]+)/data.addRow(['\3', \2]);/gp" < temp.txt > temp1.txt
cat temp1.txt > temp2.html
rm temp0.txt
rm temp.txt
rm temp1.txt
cat $here/html_components/username_dist_header.html temp2.html $here/html_components/username_dist_footer.html > username_dist.html
rm temp2.html
