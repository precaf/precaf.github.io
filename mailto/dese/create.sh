#!/bin/bash

PEOPLE="Kristen McKinnon <chpef@mass.gov>"
CC=""
BCC="beacon23@proton.me"
LETSTRING=""
TOPIC="Take Action for Healthy Youth - Support DESE Framework"
OUTPUTFILE="index.html"
TEMPFILE="_temp_"

function letter {
read -d '' LETSTRING << _EOR_
Department of Elementary and Secondary Education
Attention: Kristen McKinnon
75 Pleasant Street
Malden, MA 02148

Dear Ms. McKinnon:

I am writing today in full support of the new comprehensive health and physical education curriculum framework. An updated framework grounded in science that reflects best practices helps health educators teach students what they need to know at every grade level. 

Massachusetts is one of 21 states that does not yet require sex education and existing standards covering STDs and health relationships still need work. Governor Healy's proposals which have been realized in the DESE draft and supported by new state legislation recognize and address these deficits. They also address concerns of parents whose religious beliefs do not accept non-normative aspects of sexuality and gender since the legislation provides for opting-out.

But for an overwhelming number of Commonwealth families it is important that students have a health curriculum which emphasizes the importance of consent in a healthy relationship and one that is inclusive of students of all gender identities and sexual orientations. 

I urge DESE to vote to adopt this new Framework and I look forward to learning how DESE will support educators in implementing it in their classrooms. 

Sincerely,

Name & address

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
  echo "<link href=\"//fonts.googleapis.com/css?family=Raleway:400,300,600\" rel=\"stylesheet\" type=\"text/css\">" >> "$OUTPUTFILE"
  echo "<link rel=\"stylesheet\" href=\"../css/normalize.css\">" >> "$OUTPUTFILE"
  echo "<link rel=\"stylesheet\" href=\"../css/skeleton.css\">" >> "$OUTPUTFILE"
  echo "<link rel=\"stylesheet\" href=\"../css/legislation.css\">" >> "$OUTPUTFILE"
  echo "<link rel=\"icon\" type=\"image/png\" href=\"../images/favicon.png\">" >> "$OUTPUTFILE"
  echo "</head>" >> "$OUTPUTFILE"
  echo "<body>" >> "$OUTPUTFILE"
  echo "<div class=\"container\"><div class=\"row\"><div class=\"eleven column\" style=\"margin-top: 0%\">" >> "$OUTPUTFILE"
  echo "<h4>$TOPIC</h4>" >> "$OUTPUTFILE"
}

function description {
  echo "<p>Across the country — and unfortunately, here in Massachusetts — we  are seeing <a href='https://massinformedparents.substack.com/p/only-4-more-weeks-to-submit-your'>right-wing</a> advocates mobilizing on behalf of narrowing school curricula, banning books, and erasing the experiences of LGBTQ youth.</p>" >> "$OUTPUTFILE"
  echo "<p>That’s why we were pleased when Governor Healey took a step to move Massachusetts in the opposite direction – that of inclusion.</p>" >> "$OUTPUTFILE"
  echo "<p>According to <a href='https://siecus.org/'>Sex Ed for Social Change</a>, which follows state trends in sex education, the curriculum framework for schools here in <a href='https://siecus.org/state_profile/massachusetts-state-profile-23/'>Massachusetts</a> was last updated in 1999.</p>" >> "$OUTPUTFILE"
  echo "<p>Healey’s proposed <a href='https://www.wbur.org/news/2023/06/27/maura-healey-massachusetts-sexual-education-curriculum-update-newsletter'>updated curriculum</a> framework reflects the Healthy Youth Act (MA bills <a href='https://malegislature.gov/Bills/193/S268/Cosponsor'>S.268</a> and <a href='https://malegislature.gov/Bills/193/H544/Cosponsor'>H.544</a>) by requiring that sex education be comprehensive, medically accurate, age-appropriate, consent-based, and inclusive — as it should be, and as it should have been a generation ago.</p>" >> "$OUTPUTFILE"
  echo "<p>This legislation offers parents the ability to opt their children out of classes, and local schools the flexibility to shape their own curriculum. It is <a href='https://support.fenwayhealth.org/page/48547/action/1'>endorsed</a> by the MA <a href='https://www.healthyyouthact.org/'>Healthy Youth Coalition</a> (HYC) and has broad legislative support.</p>" >> "$OUTPUTFILE"
  echo "<p><strong>Please write</strong> DESE to express your support for the <em>Comprehensive Health and Physical Education curriculum</em>.</p>" >> "$OUTPUTFILE"
}

function committee {
RECIPIENTS="$PEOPLE"
XSUBJECT="$TOPIC"
SUBJECT=`echo "$XSUBJECT" | tr '\n' '~' | sed 's/~/%0a/g' | sed 's/ /%20/g' | sed 's/"/%22/g'`
cat > "$TEMPFILE" <<_EOF_
$LETSTRING
_EOF_
BODY=`cat "$TEMPFILE" | tr '\n' '~' | sed 's/~/%0a/g' | sed 's/ /%20/g' | sed 's/"/%22/g'`
echo "<div><a href=\"mailto:$RECIPIENTS?cc=$CC&bcc=$BCC&&subject=$SUBJECT&body=$BODY\" target=\"_blank\">Send an email to DESE</a>.</div>" >> "$OUTPUTFILE"
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
