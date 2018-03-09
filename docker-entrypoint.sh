#!/bin/sh
set -e

IP_ADDRESS=$(wget -qO- http://169.254.169.254/latest/meta-data/local-ipv4)
echo "BROADCAST ADDRESS: $IP_ADDRESS"

exec nsqd "$@" "--broadcast-address=$IP_ADDRESS"
