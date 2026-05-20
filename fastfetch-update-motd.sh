#!/bin/sh

# Get user logging in
PPID1=$(cat /proc/$PPID/status | grep PPid | awk '{ print $2 }')
PPID2=$(cat /proc/$PPID1/status | grep PPid | awk '{ print $2 }')
export USER=$(ps -x | grep $PPID2 | awk '{ print $6 }' |  sed "s/[[:digit:].-]//g")

fastfetch --config /etc/update-motd.d/fastfetch.jsonc --pipe false
