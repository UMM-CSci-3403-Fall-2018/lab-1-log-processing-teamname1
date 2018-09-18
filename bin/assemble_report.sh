#!/bin/bash
#storing the starting location
here=$(pwd)
#cd into the desired directory
cd $1
#combines country_dist.html, hours_dist.html, and username_dist.html and puts them into temp.txt
cat country_dist.html hours_dist.html username_dist.html > temp.txt
#combines summary_plots_header.html, the temp file with all of our formatted data, and summary_plots_footer.html
$here/bin/wrap_contents.sh temp.txt $here/html_components/summary_plots failed_login_summary.html

#removes temp files
rm temp.txt
