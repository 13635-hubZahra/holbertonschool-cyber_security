#!/bin/bash
subfinder -d $1 -silent | tee /dev/stderr | while read -r sub; do ip=$(dig $sub a +short | awk 'END{print}'); [ -n "$ip" ] && echo "$sub,$ip"; done > $1.txt
