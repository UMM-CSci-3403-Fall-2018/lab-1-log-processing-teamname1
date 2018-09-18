#!/bin/bash
#storing the starting location
here=$(pwd)
#makes the tmp directory
mkdir $here/tmp
#makes the tmp_logs directory in tmp
mkdir $here/tmp/tmp_logs
#loops over every input and untars the inputs into directories corresponding to the files name
for file in "$@" 
do
 mkdir $here/tmp/tmp_logs/$(basename $file)
 tar -zxf "$file" -C $here/tmp/tmp_logs/$(basename $file) 
done
#goes over every directory in tmp_logs and runs process_client_logs.sh
for dir in $here/tmp/tmp_logs/*
do
 $here/bin/process_client_logs.sh $dir
done
#runs create_username_dist.sh on tmp_logs
$here/bin/create_username_dist.sh ./tmp/tmp_logs/
#runs create_hours_dist.sh on tmp_logs
$here/bin/create_hours_dist.sh ./tmp/tmp_logs/
#runs create_country_dist.sh on tmp_logs
$here/bin/create_country_dist.sh ./tmp/tmp_logs/
#runs assemble_report.sh on tmp_logs
$here/bin/assemble_report.sh ./tmp/tmp_logs/
#moves the output failed_login_summary.html file to the current directory
mv $here/tmp/tmp_logs/failed_login_summary.html .
#removes the tmp directory and all the files in it
rm -r $here/tmp
