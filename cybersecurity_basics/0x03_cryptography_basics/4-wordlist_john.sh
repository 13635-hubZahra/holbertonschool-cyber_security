#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" && john --show --format=Raw-SHA256 "$1" | awk -F: 'NR>1 {print $2}' | sed '/^$/d' > 4-password.txt
