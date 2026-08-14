#!/bin/bash
grep "Accepted password for" ${1:-auth.log} | awk '{print $9}' | head -n 1
