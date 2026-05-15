#!/bin/bash
grep -vh "^#" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | grep -v "^$" | grep -E "Include|KbdInteractiveAuthentication|UsePAM|X11Forwarding|PrintMotd|AcceptEnv|Subsystem|PasswordAuthentication|PermitRootLogin|AuthorizedKeysFile|TCPKeepAlive"
