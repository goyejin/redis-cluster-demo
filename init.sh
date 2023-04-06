#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

IP=$(hostname -I | tr -d ' ')

NODES=""
for INDEX in $(seq 1 6); do
    PORT=$((9900 + $INDEX))
    NODES="$NODES $IP:$PORT"
done

set -x
redis-cli --cluster create $NODES --cluster-replicas 1
redis-cli -c -p 9901 CLUSTER NODES
