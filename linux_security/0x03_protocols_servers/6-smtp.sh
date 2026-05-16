#!/bin/bash
line=$(grep "^smtpd_tls_security_level" /etc/postfix/main.cf | grep -v "^#")

if [ -z "$line" ]; then
    echo "STARTTLS not configured"
else
    echo "$line" | sed 's/^[ \t]*//;s/[ \t]*$//'
fi
