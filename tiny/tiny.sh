#!/bin/bash

echo '"url";"short_url"' > urls.csv
function process {
  echo "\"$2\";\"$1\"" >> urls.csv
}

process "barnstable-287g" "https://drive.google.com/drive/folders/1t9C89EvDeu4EmOi_uA7iLvets6d2nNln"
process "bccj-abf" "https://drive.google.com/drive/folders/1QEEXEqHk2YNQgXiwamNXq_VNBmsyvr-g"
process "bccj-aclu" "https://drive.google.com/drive/folders/1r2fhT6O0BaV6B8eVgTFIikzrZJvFao2s"
process "bccj-doc-securus" "https://drive.google.com/drive/folders/13zQ7sRaCWBMSxRtNkZGZVi5DcFeWz-uC"
process "bccj-foia" "https://drive.google.com/drive/folders/1h3TN3PxmLZt7OJ1b0VYLsU441zpwQ0cp"
process "bccj-healey-letter" "https://drive.google.com/file/d/15JCHzhTHYwAHkWSHd7McvNjHwVZ3vnav"
process "bccj-ice-costs" "https://drive.google.com/file/d/1kUwmMLlZtkzI0MiYYRMKIM8fdzfUApDV"
process "bccj-madeira" "https://drive.google.com/drive/folders/1z7gMtyeRccND7QJjOu0j8xUVRuhCEKc1"
process "bccj-msa" "https://drive.google.com/file/d/1PjpStpCNo03wlCdj8rliZoArc9_b0TLG/view"
process "bccj-oig-press" "https://drive.google.com/file/d/1mQ-Fae9nJtbNoyGLujiMKFobN2xrNivD"
process "bccj-oig" "https://drive.google.com/drive/folders/1Z9_H9yP_2rTP70rmbXTndv6bd1VXu4jh"
process "bccj-resources" "https://drive.google.com/drive/folders/1miMcGzM7VB811sCYLpCo3yBCvjqB5Uck"
process "bccj-sca" "https://drive.google.com/drive/folders/1enEhbxl-KCrlg0WAsA0HEOtfSfTM2Flf"
process "bcso-287g-2019" "https://drive.google.com/file/d/1vsumLOGs8iWJ-kNMZ7lAlgrOBxUzsyaa"
process "bcso-audit" "https://www.mass.gov/audit/audit-of-the-bristol-county-sheriffs-office"
process "faircis" "https://drive.google.com/drive/folders/1_8QOXpyXdHSD-aEIDcPC_ttmRHiX13bX"
process "hodgson-vid" "https://drive.google.com/drive/folders/1WmwsA2CsTsDlb3tAT4p2EI3Jtp0IkHK_"
process "january-2020" "https://drive.google.com/drive/folders/165CeZ7pXEeRNLunl-lVxwJ1XMTKDIvXZ"
process "MA-sheriff" "https://malegislature.gov/Laws/Search?SearchTerms=sheriff&Page=&Refinements[lawslawtype]=47656e6572616c204c6177"
process "muckrock-travel" "https://www.muckrock.com/foi/bristol-county-213/bristol-county-sheriff-absences-54706/"
process "shameful-sheriff" "https://drive.google.com/drive/folders/1aibYoYHpDor0N5w-O2O6F4DZgwdu9YEy"
process "sheriff-travel" "https://drive.google.com/drive/folders/1Z9_H9yP_2rTP70rmbXTndv6bd1VXu4jh"
process "tavares-interview" "https://drive.google.com/drive/folders/1mEs_H6dCDZb1isuyU7uT4vnfI6UoQmuS"
