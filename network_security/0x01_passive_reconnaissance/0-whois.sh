#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1
OUTPUT_FILE="${DOMAIN}.csv"

whois "$DOMAIN" | awk -v ORS="" '
BEGIN {
    split("Registrant,Admin,Tech", groups, ",")
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext,Fax,Fax Ext,Email", fields, ",")
}

{
    clean_line = $0
    sub(/^[ \t]+/, "", clean_line)
    sub(/[ \t\r\n]+$/, "", clean_line)
    
    if (clean_line ~ /^[A-Za-z ]+:/) {
        colon_idx = index(clean_line, ":")
        key = substr(clean_line, 1, colon_idx - 1)
        value = substr(clean_line, colon_idx + 1)
        
        sub(/^[ \t]+/, "", value)
        sub(/[ \t]+$/, "", value)
        
        sub(/^[A-Za-z ]+ /, "", key)
        
        data[key] = value
    }
}

END {
    out = ""
    for (i = 1; i <= 3; i++) {
        g = groups[i]
        for (j = 1; j <= 12; j++) {
            f = fields[j]
            
            val = data[f]
            csv_field = g " " f
            
            if (f ~ /Ext$/) {
                csv_field = csv_field ":"
            }
            
            if (f == "Street" && val != "") {
                val = val " "
            }
            
            out = out csv_field "," val "\n"
        }
    }
    sub(/\n$/, "", out)
    printf "%s", out
}' > "$OUTPUT_FILE"
