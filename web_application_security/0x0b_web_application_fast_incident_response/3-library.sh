#!/bin/bash
awk -F'"' '{split($1, a, " "); count[a[1]]++; ua[a[1]]=$6} END {max=0; for (ip in count) if (count[ip]>max) {max=count[ip]; top=ip}; print ua[top]}' ${1:-logs.txt}
