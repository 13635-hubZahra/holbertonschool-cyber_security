#!/bin/bash
RESULT=$(grep "smtpd_tls_security_level" /etc/postfix/main.cf | grep -v "^#")
if [ -z "$RESULT" ]; then
    echo "STARTTLS not configured"
else
    echo "$RESULT"
fi
