#!/bin/bash
grep -hve "^#" -e "^$" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | grep -E "KbdInteractiveAuthentication|UsePAM|X11Forwarding|PrintMotd|AcceptEnv|Subsystem|PasswordAuthentication|PermitRootLogin|AuthorizedKeysFile|TCPKeepAlive"
