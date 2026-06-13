#!/bin/bash
subfinder -d $1 -silent -no-color | tee /dev/stderr | while read -r sub; do ip=$(getent hosts "$sub" | awk '{print $1}'); [ -n "$ip" ] && echo "$sub,$ip"; done > $1.txt
