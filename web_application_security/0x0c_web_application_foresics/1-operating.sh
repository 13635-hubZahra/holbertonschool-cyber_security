#!/bin/bash
grep "Linux version" ${1:-dmesg}
