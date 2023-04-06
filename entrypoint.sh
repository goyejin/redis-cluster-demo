#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

trap "$BASEDIR/stop.sh" TERM

if [ -d "$BASEDIR/nodes" ]; then
    "$BASEDIR/start.sh"
else
    "$BASEDIR/startup.sh"
fi

tail -f "$BASEDIR/logs/node01.log"
