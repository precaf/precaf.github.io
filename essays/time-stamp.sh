#!/bin/bash

function fixtime {
  echo "fixtime $1 $2"
  touch -t "$2" "$HOME/Sites/essays/$1"
  touch -t "$2" "$HOME/Sites/essays/$1/item.md"
  touch -t "$2" "$HOME/Sites/essays/$1/substack-version.html"
  touch -t "$2" "$HOME/Sites/essays/$1/index.html"
}

function process {
  THEDATE=`cat "$HOME/Sites/essays/$1/item.md" | grep '^date:' | sed "s/date: //g" | sed "s/'//g" | sed "s/ //g" | sed "s/://g" | sed "s/-//g"`
  fixtime "$1" "$THEDATE"
}

IFS=$(echo -en "\n\b")
for DIRNAME in `find "$HOME/Sites/essays" -name 'item.md' | sort -u`
do
  NEWNAME=`echo "$DIRNAME" | sed "s^/Users/david/Sites/essays/^^g" | sed "s^/item.md^^g" | grep '/'`
  if [ "$NEWNAME" != "" ]; then
    process "$NEWNAME"
  fi
done
