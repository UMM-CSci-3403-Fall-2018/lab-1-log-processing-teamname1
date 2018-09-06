#!/bin/bash
directory=$(pwd)
cd $1
cat var/log/* > temp.txt
sed -nr 's/([[:alnum:]]+)([[:space:]]*)([[:alnum:]]+ [[:alnum:]]+):([^[:space:]]+) ([^[:space:]]+) sshd([^[:space:]]+) Failed password for([[:space:]]*[^[:space:]]*[[:space:]]*[^[:space:]]* )([[:alnum:]]+) from ([^[:space:]]+) port ([[:alnum:]]+) ssh2/\1 \3 \8 \9/gp' < temp.txt > failed_login_data.txt
rm temp.txt
