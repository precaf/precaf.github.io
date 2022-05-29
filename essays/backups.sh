#!/bin/bash

SOURCE="$HOME/Sites/essays"
TARGET="$HOME/Desktop/backup"
MARKINDEX="/var/tmp/228738t8tr.txt"
rm "$MARKINDEX"

function addline {
  echo -e "$2" >> "$1"
}

function header {
TODAY=`date "+%Y-%m-%d"`
DATUM="date: '$TODAY 08:00'"
DATUM=""
FILENAME="$1"
TITLE="$2"
cat > "$FILENAME" <<ZZZZZ
---
author: David Ehrens
title: $TITLE
$DATUM
taxonomy:
   category: blog
   tag: [$TITLE]
---
---

ZZZZZ
}

function processitem {
  mkdir -p "$TARGET/$1/$2/"
  MARKDOWN="$SOURCE/$1/$2/item.md"
  HTMLOUT="$TARGET/$1/$2/index.html"
  THEDATE=`cat "$MARKDOWN" | grep '^date:' | awk '{print $2}' | sed "s/'//g"`
  THETITLE=`cat "$MARKDOWN" | grep '^title:' | sed "s/title: //g"`
  echo "Processing $1:$2: $THEDATE"
  pandoc -s "$MARKDOWN" --template=$SOURCE/mytemplate.html | sed 's|<hr />||g' | sed 's|href="http|target="_blank" href="http|g' | sed 's|../broken.php?url=||g' | sed 's|a href="|a target="_blank" href="|g' > "$HTMLOUT"
  echo "$THEDATE | [$THETITLE]($2/index.html)" >> "$MARKINDEX"
}

function process {
  echo -e "\n***** $1 *****"
  addline "$TARGET/index.md" "- [$1]($1/index.html)"
  rm -rf "$TARGET/$1/"
  mkdir -p "$TARGET/$1/"
  cp -R "$SOURCE/$1/" "$TARGET/$1/"
  echo "<ul>" > "$TARGET/$1/index.html"
  header "$TARGET/$1/index.md" "Essays on $1"
  addline "$TARGET/$1/index.md" "Essays with category: $1:\n"
  addline "$TARGET/$1/index.md" "Date | Title"
  addline "$TARGET/$1/index.md" ":--------- | :---------------------------------------"
  rm -rf "$MARKINDEX"
  IFS=$(echo -en "\n\b")
  for dir in $SOURCE/$1/*/
  do
    CURRENT=`echo "$dir" | sed "s|$SOURCE/$1/||g" | sed 's|/||g'`
    processitem "$1" "$CURRENT"
  done
  sort -u < "$MARKINDEX" >> "$TARGET/$1/index.md" 
  rm -rf "$MARKINDEX"
  addline "$TARGET/$1/index.md" "</div>"
  pandoc -s "$TARGET/$1/index.md" --template=$SOURCE/mytemplate.html | sed 's|<hr />||g' | sed 's|href="http|target="_blank" href="http|g' | sed 's|../broken.php?url=||g' | sed 's|a href="|a target="_blank" href="|g' > "$TARGET/$1/index.html"
  rm -rf "$TARGET/$1/index.md"
}

rm -rf "$TARGET/"
mkdir -p "$TARGET/"
header "$TARGET/index.md" "My essays"
addline "$TARGET/index.md" "My essays are divided up into the following collections:\n"
IFS=$(echo -en "\n\b")
for DIRNAME in `find "$SOURCE" -depth 1 -type d | sed 's^/Users/david/Sites/essays/^^g' | sort -u`
do
  process "$DIRNAME"
done
pandoc -s "$TARGET/index.md" --template=$SOURCE/mytemplate.html | sed 's|<hr />||g' | sed 's|href="http|target="_blank" href="http|g' | sed 's|../broken.php?url=||g' | sed 's|a href="|a target="_blank" href="|g' > "$TARGET/index.html"
rm -rf "$TARGET/index.md"
cp $SOURCE/*.command $TARGET/
cp $SOURCE/*.sh $TARGET/
cp $SOURCE/*.txt $TARGET/
cp $SOURCE/mytemplate.* $TARGET/
