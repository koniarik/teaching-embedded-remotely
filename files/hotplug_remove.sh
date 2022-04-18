#!/usr/bin/bash
exec 2>/tmp/log
set -x

VM=$1
FILE=$2

virsh detach-device ${VM} ${FILE} 
