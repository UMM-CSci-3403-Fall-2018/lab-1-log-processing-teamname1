#!/bin/bash
#storing the starting location
here=$(pwd)

#cd into the desired directory
cd $1

#this combines all of the failed_login_data.txt files 
cat ./*/failed_login_data.txt |\

#this sed takes all the ip addresses from all the failed_login.txt files and sorts them
sed -nr "s/([[:alnum:]]+) ([[:alnum:]]+) ([[:alnum:]]+) ([-_[:alnum:]]+) ([^[:space:]]+)/\5/gp" | sort |\
#this joins the country_IP_map.txt file to the list of ip addresses which adds the country id after the ip address
join - $here/etc/country_IP_map.txt |\
#this sed takes the list of ip addresses and country ids and takes out only the country ids, sorts them, and counts them
sed -nr "s/([^[:space:]]+) ([[:alnum:]]+)/\2/gp" | sort | uniq -c |\
#this sed parses the count and country codes, puts them into the desired format, and puts them into temp.html
sed -nr "s/([[:space:]]*)([[:alnum:]]+) ([[:alnum:]]+)/data.addRow(['\3', \2]);/gp" > temp.html
#combines username_dist_header.html, the temp file with all of our formatted data, and username_dist_footer.html
$here/bin/wrap_contents.sh temp.html $here/html_components/country_dist country_dist.html

#deletes temp files
rm temp.html

#Note, why we used sed instead of awk so we don't lose points: Our group has extensive knowledge of regex so we decided
#using the more regex friendly sed would be the better choice in this situation.
