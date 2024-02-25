#!/bin/bash

# this is a Unix & MacOS script that will generate the correct HTML
# for your Wordpress image caption.

CAPTION="Black Lives Matter - We Won't Be Silenced"
CAPTIONLINK="https://www.flickr.com/photos/59952459@N08/28113568721"

AUTHOR="Alisdare Hickson"
AUTHORLINK="https://www.flickr.com/photos/alisdare/"

LICENSE="CC BY-NC 2.0"
LICENSELINK="https://creativecommons.org/licenses/by-nc/2.0/"

echo "<span style=\"font-style: italic;font-size:75%\"> \"<a href=\"$CAPTIONLINK\" target=\"_blank\" rel=\"noopener noreferrer\">$CAPTION</a>”, by <a href=\"$AUTHORLINK\" target=\"_blank\" rel=\"noopener noreferrer\">$AUTHOR</a>, licensed under <a href=\"$LICENSELINK\" target=\"_blank\" rel=\"noopener noreferrer\">$LICENSE</a></span>" > caption.txt

open caption.txt
