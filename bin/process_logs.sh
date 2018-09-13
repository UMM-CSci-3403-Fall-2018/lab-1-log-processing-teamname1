#!/bin/bash
here=$(pwd)
mkdir $here/tmp
mkdir $here/tmp/tmp_logs
for file in "$@" 
do
 mkdir $here/tmp/tmp_logs/$(basename $file)
 tar -zxf "$file" -C $here/tmp/tmp_logs/$(basename $file) 
done
for dir in $here/tmp/tmp_logs/*
do
 $here/bin/process_client_logs.sh $dir
done
$here/bin/create_username_dist.sh ./tmp/tmp_logs/
$here/bin/create_hours_dist.sh ./tmp/tmp_logs/
$here/bin/create_country_dist.sh ./tmp/tmp_logs/
$here/bin/assemble_report.sh ./tmp/tmp_logs/
mv $here/tmp/tmp_logs/failed_login_summary.html .
rm -r $here/tmp
