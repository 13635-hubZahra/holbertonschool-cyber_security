#!/bin/bash
john --wordlist=/usr/share/dict/rockyou.txt --format=Raw-MD5 $1
