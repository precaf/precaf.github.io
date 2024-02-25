#!/bin/bash

TINY="http://precaf.github.io/tiny/"

rm ".htaccess"
echo "<!DOCTYPE html>" > index.html
echo "<html lang='en'>" >> index.html
echo "<head>" >> index.html
echo "<meta charset='UTF-8'>" >> index.html
echo "<meta name=\"robots\" content=\"noindex\">" >> index.html
echo "<title>Redirects in $TINY</title>" >> index.html
echo "<style>" >> index.html
echo "body { font-family: monospace; background-color: lightgray; }" >> index.html
echo "h2 { color: #880000; }" >> index.html
echo "a { color: #880000; }" >> index.html
echo "</style>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "<h2>Redirects in $TINY</h2>" >> index.html
echo "<ul>" >> index.html

function process {
  echo "Redirect 303 \"/tiny/$1\" \"$2\"" >> .htaccess
  echo "<li><a href=\"$TINY$1\" target=\"_blank\">$TINY$1</a> &mdash;&gt;<br/>$2<br/>&nbsp;</li>" >> index.html
}

process "sema-freepalestine" "https://ceasefirenow.substack.com"
process "southcoast-reads" "https://southcoastreads.substack.com"
process "dartmouth-dems" "https://dartmouthdems.substack.com"
process "southcoast-dems" "https://linktr.ee/southcoast.dems"

echo "</ul>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html
open index.html
open -a BBEdit .htaccess
rm .DS_Store
