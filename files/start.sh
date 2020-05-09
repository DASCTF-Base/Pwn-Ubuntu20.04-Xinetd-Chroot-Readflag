#!/bin/bash

if [[ -f /flag.sh ]]; then
	source /flag.sh
fi

chown root:ctf /home/ctf/pwn
/etc/init.d/xinetd start
tail -f /dev/null
