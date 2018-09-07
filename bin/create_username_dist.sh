#!/bin/bash
cd $1
sed -nr "s/([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([^[:space:]]+)/\4/gp" < failed_login_data.txt | sort | uniq -c > temp.txt
sed -nr "s/([[:space:]]*)([[:alnum:]]+) ([[:alnum:]]+)/data.addRow(['\3', \2])/gp" < temp.txt > test1.txt
rm temp.txt
