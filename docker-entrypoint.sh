#!/bin/sh
set -e

IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
echo "BROADCAST ADDRESS: $IP_ADDRESS"

exec nsqd "$@" "--broadcast-address=$IP_ADDRESS"
