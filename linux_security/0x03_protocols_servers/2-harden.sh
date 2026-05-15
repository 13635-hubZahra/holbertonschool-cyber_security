#!/bin/bash
find / -type d -perm -0002 2>/dev/null | while read -r dir; do
    echo "$dir"
    chmod 755 "$dir"
done
