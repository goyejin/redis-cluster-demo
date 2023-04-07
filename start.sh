#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

for INDEX in $(seq 1 6); do
    PORT=$((9900 + $INDEX))
    CONF="$BASEDIR/nodes/node0${INDEX}.conf"
    LOGF="$BASEDIR/logs/node0${INDEX}.log"
    nohup redis-server "$CONF" >> "$LOGF" 2>&1 &
    sleep 3
done

ps -ef | grep redis-server | grep -v grep
