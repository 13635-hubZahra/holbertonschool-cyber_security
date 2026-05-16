#!/bin/bash
sed '/^#/d; /^[[:space:]]*$/d' /etc/ssh/sshd_config
