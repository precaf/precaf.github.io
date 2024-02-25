#!/bin/bash

rm doit.html

function process {
  echo "<div class=\"responsive\">" >> doit.html
  echo "  <div class=\"gallery\">" >> doit.html
  echo "    <a target=\"_blank\" href=\"$1\">" >> doit.html
  echo "      <img src=\"$2.png\" alt=\"$1\" width=\"600\">" >> doit.html
  echo "    </a>" >> doit.html
  echo "    <div class=\"desc\">$1</div>" >> doit.html
  echo "  </div>" >> doit.html
  echo -e "</div>\n" >> doit.html
}

process 'Flock ALPR FAQs-1.pdf' 'pdf'
process 'Flock Overview for Cities-1.pdf' 'pdf'
process 'Flock Safety ALPR Privacy + Ethics-1.pdf' 'pdf'
process 'alpr.html' 'html'
