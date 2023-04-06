#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

set -x

"$BASEDIR/stop.sh"
sleep 5

rm -rf "$BASEDIR/nodes"
rm -rf "$BASEDIR/logs"
rm -rf "$BASEDIR/others"

rm -rf "$BASEDIR/appendonly.aof"
rm -rf "$BASEDIR/dump.rdb"
