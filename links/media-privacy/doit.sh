rm doit.html

function process {
  echo "<div class=\"responsive\">" >> doit.html
  echo "  <div class=\"gallery\">" >> doit.html
  echo "    <a target=\"_blank\" href=\"$1.png\">" >> doit.html
  echo "      <img src=\"$1.png\" alt=\"$1\" width=\"600\">" >> doit.html
  echo "    </a>" >> doit.html
  echo "    <div class=\"desc\">$1</div>" >> doit.html
  echo "  </div>" >> doit.html
  echo -e "</div>\n" >> doit.html
}

process discord
process facebook
process hive
process linkedin
process mastodon
process post
process reddit
process snapchat
process spill
process telegram
process threads
process tiktok
process truthsocial
process tumblr
process twitter
