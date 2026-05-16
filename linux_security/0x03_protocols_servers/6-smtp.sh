#!/bin/bash
RESULT=$(postconf smtpd_tls_security_level 2>/dev/null)

if [ -z "$RESULT" ] || [[ "$RESULT" == *"= "* ]]; then
    echo "STARTTLS not configured"
else
    echo "$RESULT"
fi
