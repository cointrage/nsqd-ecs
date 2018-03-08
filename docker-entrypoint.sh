#!/bin/sh
set -e

PUBLIC_IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
echo "BROADCAST ADDRESS: $PUBLIC_IP_ADDRESS"

exec nsqd "$@" "--data-path=/data" "--broadcast-address=$PUBLIC_IP_ADDRESS"
