PEOPLE="Senate Chair John J. Cronin <John.Cronin@masenate.gov>,Senate Vice Chair Susan Moran <Susan.Moran@masenate.gov>,House Chair Tackey Chan <Tackey.Chan@mahouse.gov>,House Vice Chair Mary Keefe <Mary.Keefe@mahouse.gov>"
CC="Rep. Alan Silvia <Alan.Silvia@mahouse.gov>,Rep. Antonio Cabral <Antonio.Cabral@mahouse.gov>,Rep. Carole A. Fiola <Carole.Fiola@mahouse.gov>,Rep. Christopher Hendricks <Chris.Hendricks@mahouse.gov>,Rep. Christopher M. Markey <christopher.markey@mahouse.gov>,Rep. Norman Orrall <Norman.Orrall@mahouse.gov>,Rep. Patricia Haddad <Patricia.Haddad@mahouse.gov>,Rep. Paul A. Schmid <paul.schmid@mahouse.gov>,Rep. Steve Howitt <Steven.Howitt@mahouse.gov>,Rep. Susan Williams Gifford <susan.gifford@mahouse.gov>,Rep. William M. Straus <William.Straus@mahouse.gov>,Sen. Marc R. Pacheco <Marc.Pacheco@masenate.gov>,Sen. Mark C. Montigny <Mark.Montigny@masenate.gov>,Sen. Michael Rodrigues <Michael.Rodrigues@masenate.gov>"
BCC=""
LETSTRING=""
TOPIC="Support An Act to protect patient privacy and prevent unfair and deceptive advertising of pregnancy-related services"
OUTPUTFILE="index.html"
TEMPFILE="_temp_"

function letter {
read -d '' LETSTRING << _EOR_
Dear Committee Chairs and SouthCoast legislators,

I am writing in support of An Act to protect patient privacy and prevent unfair and deceptive advertising of pregnancy-related services by so called "pregnancy crisis centers" (Senate Bill S.174 and House Bill H.377). These fake clinics deceptively and fraudulently advertise medical services to women seeking abortions but offer none, use strong-arm tactics including releasing personal information to third parties, and engage women in counseling and religious proselytizing well into late stage pregnancy in order to ultimately prevent the abortion. Massachusetts bills S.174 and H.377 thankfully put legal protections in place to protect women and prevent such centers from masquerading as health care clinics.

Sincerely,

your name and address
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
  echo "<p>Anti-abortion organizations are setting up &quot;crisis centers&quot; or &quot;fake clinics,&quot; as reproductive rights advocates call them, to deceptively advertise medical services, but offer none, use strong-arm tactics including releasing or threatening to release personal information to third parties, and frequently engage clients in counselling well into late stage pregnancy in order to prevent the abortion outright. </p>" >> "$OUTPUTFILE"
  echo "<p>National organizations like SPARK, ReproAction, and Abortion Access Front have exposed these clinics for what they are and Massachusetts bills S.174 and H.377 thankfully put legal protections for women into law.</p>" >> "$OUTPUTFILE"
  echo "<p>Tomorrow the Massachusetts Joint Committee on Consumer Protection and Professional Licensure will <strong>hold hearings tomorrow</strong> that will include testimony on <a href='https://malegislature.gov/Bills/193/S174'>Senate Bill S.174</a> (also filed as <a href='https://malegislature.gov/Bills/193/H377'>House Bill H.377</a>), <em>An Act to protect patient privacy and prevent unfair and deceptive advertising of pregnancy-related services</em>. The legislation also entails an appropriations component found in <a href='https://malegislature.gov/Bills/193/H57'>House Bill H.57</a>, <em>An Act making appropriations for the Fiscal Year 2023 to provide for supplementing certain existing appropriations and for certain other  activities and projects</em>. </p>" >> "$OUTPUTFILE"
  echo "<p>Besides legal protections for women, the appropriations bill specifies that &quot;not less than \$1,000,000 shall be expended for a public awareness campaign to educate providers and the public about so-called crisis pregnancy centers and pregnancy resource centers and their lack of medical services; provided further, that said campaign shall include information on the availability of providers across the commonwealth that provide legitimate medical and family planning services.&quot;</p>" >> "$OUTPUTFILE"
  echo "<p>Naturally, right-wing groups are up in arms. The Massachusetts Family Institute is <a href='https://www.mafamily.org/2023/07/19/action-alert-stop-the-pregnancy-resource-center-gag-rule/'>rallying</a> supporters to show up at <strong>tomorrow&#39;s hearings</strong>. MFI takes great offense at the appropriations bill and has framed the legislation as an attack on Christian Nationalists&#39; First Amendment rights [to deceive women], <a href='https://www.mafamily.org/takeaction/'>calling it</a> a &quot;gag order.&quot;</p>" >> "$OUTPUTFILE"
  echo "<p>But this is first and foremost a health and consumer protection issue. These fake abortion clinics are as much a menace to public health as the guy who does liposuction in his garage.</p>" >> "$OUTPUTFILE"
  echo "<p><strong>Please write</strong> to your legislator and to the Joint Committee to express your support for <em>An Act to protect patient privacy and prevent unfair and deceptive advertising of pregnancy-related services</em>.</p>" >> "$OUTPUTFILE"
}

function committee {
RECIPIENTS="$PEOPLE"
XSUBJECT="$TOPIC"
SUBJECT=`echo "$XSUBJECT" | tr '\n' '~' | sed 's/~/%0a/g' | sed 's/ /%20/g' | sed 's/"/%22/g'`
cat > "$TEMPFILE" <<_EOF_
$LETSTRING
_EOF_
BODY=`cat "$TEMPFILE" | tr '\n' '~' | sed 's/~/%0a/g' | sed 's/ /%20/g' | sed 's/"/%22/g'`
echo "<div><a href=\"mailto:$RECIPIENTS?cc=$CC&bcc=$BCC&&subject=$SUBJECT&body=$BODY\" target=\"_blank\">Send an email to the Joint Commmittee and legislators</a>.</div>" >> "$OUTPUTFILE"
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
