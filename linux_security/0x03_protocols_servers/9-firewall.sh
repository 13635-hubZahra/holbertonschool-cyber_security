#!/bin/bash
iptables -A INPUT -s "$1" -p tcp --dport 22 -j ACCEPT && iptables -A INPUT -j DROP
