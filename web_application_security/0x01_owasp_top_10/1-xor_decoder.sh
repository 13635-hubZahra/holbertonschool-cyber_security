#!/bin/bash

if [ -z "$1" ]; then
    exit 1
fi

input_string="${1#"{xor}"}"

echo -n "$input_string" | base64 -d | awk '
BEGIN {
    FS = ""
}
{
    for (i = 1; i <= NF; i++) {
        char = substr($0, i, 1)
        printf "%c", xor(ord[char], 0x5f)
    }
}
' 2>/dev/null || python3 -c "
import base64
encoded = '$input_string'
decoded = base64.b64decode(encoded)
print(''.join(chr(b ^ 0x5f) for b in decoded), end='')
"
echo ""
