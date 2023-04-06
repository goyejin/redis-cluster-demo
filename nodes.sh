#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

TMPL="$BASEDIR/node.conf.tmpl"

mkdir -p "$BASEDIR/nodes"
mkdir -p "$BASEDIR/logs"
mkdir -p "$BASEDIR/others"

rm -f "$BASEDIR/nodes/node0*.conf"

for INDEX in $(seq 1 6); do
    PORT=$((9900 + $INDEX))
    CONF="$BASEDIR/nodes/node0${INDEX}.conf"
    NODF="$BASEDIR/others/node0${INDEX}.cluster.conf"
    PORT="$PORT" NODF="$NODF" envsubst < "$TMPL" > "$CONF"
done
