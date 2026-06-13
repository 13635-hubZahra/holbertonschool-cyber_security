#!/bin/bash
useradd -m -s /bin/sh "$1"
echo -e "$2\n$2" | passwd "$1"
