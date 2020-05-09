#!/bin/bash
echo $DASFLAG > /home/ctf/flag
export DASFLAG=not_flag
DASFLAG=not_flag
chmod 600 /home/ctf/flag
