#!/bin/bash

tmp=`wc -l .todo`
count=`echo $tmp | cut -d ' ' -f1`
inp=`cat .todo | dmenu -l $count -p command`
echo $input
cmd=${inp%:*}
text=${inp#*:}
echo $cmd
echo $text

if [ "$cmd" = "add" ]; then
    echo "$((count+1)) $text" >> .todo  
elif [ "$cmd" = "del" ]; then
    sed -i "${text}d" .todo
fi
