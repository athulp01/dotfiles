#!/bin/bash

count=$(echo "dialog_list" | nc -w1 localhost 9000 | tail -n +2 | jq '.[] | select(.print_name=="Asna") | .unread')
echo $count
