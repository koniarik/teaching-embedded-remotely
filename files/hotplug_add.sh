#!/usr/bin/bash

VM=$1
VENDOR_ID=$2
PRODUCT_ID=$3
BUS=$4
PORT=$5
FILE=$6

if [ "${ACTION}" == "add" ]; then
	CMD="attach-device"
else
	CMD="detach-device"
fi

/bin/cat <<EOM >${FILE}
<hostdev mode="subsystem" type="usb" managed="yes">
  <source>
    <address type="usb" bus="${BUS}" device="${PORT}" />
  </source>
</hostdev>
EOM
( sleep 5 & virsh attach-device ${VM} ${FILE} ) &
