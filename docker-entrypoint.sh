#!/bin/sh
set -e

echo $ECS_CONTAINER_METADATA_FILE
cat $ECS_CONTAINER_METADATA_FILE

IP_ADDRESS=$(wget -O - http://ip4.me 2>/dev/null | sed -e 's#<[^>]*>##g' | grep '^[0-9]')
echo "BROADCAST ADDRESS: $IP_ADDRESS"

exec nsqd "$@" "--broadcast-address=$IP_ADDRESS"
