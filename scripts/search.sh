#!/bin/bash

GOOGLE_URL="https://www.google.co.in/search?q="
YOUTUBE_URL="https://www.youtube.com/results?search_query="
SO_URL="https://stackoverflow.com/search?q"

rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

keyword=`echo -e "Search\n" | dmenu -p Find`
chromium https://www.google.com/search?q=$keyword
