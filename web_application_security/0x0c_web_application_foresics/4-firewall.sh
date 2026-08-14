#!/bin/bash
grep "iptables -A" ${1:-auth.log} | wc -l
