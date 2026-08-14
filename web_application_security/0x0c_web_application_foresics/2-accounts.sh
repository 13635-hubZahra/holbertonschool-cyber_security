#!/bin/bash
grep "Accepted password for" ${1:-auth.log} | awk '{print $9}' | tail -n 1
