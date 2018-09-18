#!/bin/bash
#cd into the specified directory
cd $1

#combines all the files in the var/log of the directory
cat var/log/* |\
#this sed parses all of logs and only takes out the logs that are for failed logins. It parses the data from these and takes out the date, the hour of day, the name, and the ip address.
sed -nr 's/([[:alnum:]]+)([[:space:]]*)([[:alnum:]]+ [[:alnum:]]+):([^[:space:]]+) ([^[:space:]]+) sshd([^[:space:]]+) Failed password for([[:space:]]*[^[:space:]]*[[:space:]]*[^[:space:]]* )([-_[:alnum:]]+) from ([^[:space:]]+) port ([[:alnum:]]+) ssh2/\1 \3 \8 \9/gp' > failed_login_data.txt
