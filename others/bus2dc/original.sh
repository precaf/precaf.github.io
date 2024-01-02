PEOPLE="New Bedford Bus to Washington DC <bus2dc@mailgroup.io>"
LETSTRING=""
TOPIC="Reserve your seat on the 1/13 New Bedford bus to Washington DC"
OUTPUTFILE="index.html"
TEMPFILE="_temp_"

function letter {
read -d '' LETSTRING << _EOR_
Hello,

I want to reserve a seat on the January 12th bus from New Bedford, which will carry participants to the March on Washington for Gaza and arrive the morning of January 13th.

I agree that this order is a promise to reimburse the coalition the cost of the \$50 trip. 

The trip includes two sandwiches, muffins and cookies. Please specify your sandwich preferences. We will make every effort to accommodate, but cannot guarantee, that they will be available at the time of departure. So if you have any dietary restrictions let us know what they are.

[sandwich preference]

[name]
[address]
[city, state, zip]
[cell phone number]
[email address]

_EOR_
}

function header {
  rm "$OUTPUTFILE"
  echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">" >> "$OUTPUTFILE"
  echo "<html>" >> "$OUTPUTFILE"
  echo "<head>" >> "$OUTPUTFILE"
  echo "<meta content=\"text/html; charset=UTF-8\" http-equiv=\"content-type\">" >> "$OUTPUTFILE"
  echo "<title>$TOPIC</title>" >> "$OUTPUTFILE"
  echo "<meta name=\"description\" content=\"\">" >> "$OUTPUTFILE"
  echo "<meta name=\"author\" content=\"\">" >> "$OUTPUTFILE"
  echo "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">" >> "$OUTPUTFILE"
  echo "</head>" >> "$OUTPUTFILE"
  echo "<body>" >> "$OUTPUTFILE"
  echo "<div class=\"container\"><div class=\"row\"><div class=\"eleven column\" style=\"margin-top: 0%\">" >> "$OUTPUTFILE"
  echo "<h4>$TOPIC</h4>" >> "$OUTPUTFILE"
}

function description {
  echo "<p>This will generate an email to collect your contact information and sandwich preferences.</p>" >> "$OUTPUTFILE"
}

function committee {
RECIPIENTS="$PEOPLE"
XSUBJECT="$TOPIC"
SUBJECT=`echo "$XSUBJECT" | tr '\n' '~' | sed 's/~/%0a/g' | sed 's/ /%20/g' | sed 's/"/%22/g'`
cat > "$TEMPFILE" <<_EOF_
$LETSTRING
_EOF_
BODY=`cat "$TEMPFILE" | tr '\n' '~' | sed 's/~/%0a/g' | sed 's/ /%20/g' | sed 's/"/%22/g'`
echo "<div><a href=\"mailto:$RECIPIENTS?subject=$SUBJECT&body=$BODY\" target=\"_blank\">Reserve your seat on the bus.</a>.</div>" >> "$OUTPUTFILE"
}

function footer {
  echo "</div>" >> "$OUTPUTFILE"
  echo "</div></div></div>" >> "$OUTPUTFILE"
  echo "</body>" >> "$OUTPUTFILE"
  echo "</html>" >> "$OUTPUTFILE"
  rm "$TEMPFILE"
}

letter
header
description
committee
footer
