#! /bin/bash

if [ "$1" = "count" ]; then
  echo `calcurse -d 3 --format-apt="%m\n" | egrep '((0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-][0-9]*:|^$)' -v | wc -l`
fi

if [ "$1" = "display" ]; then
  echo `calcurse -d 3 --format-apt="%S:%m\n" | dmenu`
fi
