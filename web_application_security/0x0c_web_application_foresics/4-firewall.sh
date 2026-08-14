#!/bin/bash
grep "iptables" ${1:-auth.log} | wc -l
