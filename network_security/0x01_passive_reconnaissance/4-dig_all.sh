#!/bin/bash
dig +noall +answer $1 A $1 AAAA $1 MX $1 NS $1 TXT $1 SOA
