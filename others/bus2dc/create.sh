PEOPLE="New Bedford Bus to Washington DC <bus2dc@mailgroup.io>"
LETSTRING=""
TOPIC="Reserve your seat on the 1/13 New Bedford bus to Washington DC"
OUTPUTFILE="index.html"
TEMPFILE="_temp_"

function letter {
read -d '' LETSTRING << _EOR_
Please provide the following information:

Name of individual interested in either taking or donating to the bus: [name]

Payment [\$amount] [type]

Taking the bus [__]  Can\'t attend but will donate [__]

Email address: [email]

Cell phone* number: [cellphone]

*so we can reach you in DC if we get separated, since we would be sad to leave without you!

Choice of Sandwiches (2 per person) for bus trip: 1. [sandwich] 2. [sandwich]
e.g., 1. Ham and Cheese and 2. Chicken Salad

Name of emergency contact* [name]
Number of emergency contact [phone]

*IF something should happen to you! e.g., spouse, significant other, parent, etc.

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
