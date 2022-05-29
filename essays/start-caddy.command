#!/bin/bash
BASEDIR=`dirname "$BASH_SOURCE"`
cd "$BASEDIR"
caddy start --config Caddyfile.txt
# osx-specific alert
osascript -e 'tell application (path to frontmost application as text) to display dialog "When you are ready to shut down the server, enter \"caddy stop\"" buttons {"OK"} with icon stop'
open http://localhost
