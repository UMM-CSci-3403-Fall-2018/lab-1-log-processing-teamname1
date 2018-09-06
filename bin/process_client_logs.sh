#!/bin/bash
directory=$(pwd)
cd $1/var/log
sed -nr 's/([[:alnum:]]+ [[:alnum:]]+ [[:alnum:]]+):([^[:space:]]+) ([^[:space:]]+) sshd([^[:space:]]+) Failed password for invalid user ([[:alnum:]]+) from ([^[:space:]]+) port ([[:alnum:]]+) ssh2/\1 \2 \5 \6/gp' < input.txt > output.txt
