#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

IP=$(hostname -i | tr -d ' ')

NODES=""
for INDEX in $(seq 1 6); do
    PORT=$((9900 + $INDEX))
    NODES="$NODES $IP:$PORT"
done

set -x
redis-cli -a 123456 --cluster create $NODES --cluster-replicas 1
redis-cli -a 123456 -c -p 9901 CLUSTER NODES
