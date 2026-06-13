#!/bin/bash
subfinder -d $1 -silent | tee /dev/stderr | while read -r sub; do ip=$(dig $sub a +short | tail -n1); [ -n "$ip" ] && echo "$sub,$ip"; done > $1.txt
