#!/bin/bash
here=$(pwd)
cd $1

cat country_dist.html hours_dist.html username_dist.html > temp1.html
#cat $here/html_components/summary_plots_header.html temp1.html $here/html_components/summary_plots_footer.html > failed_login_summary.html
$here/bin/wrap_contents.sh temp1.html $here/html_components/summary_plots failed_login_summary.html
rm temp1.html
