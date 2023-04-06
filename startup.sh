#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

set -x

"$BASEDIR/cleanup.sh"
"$BASEDIR/nodes.sh"
"$BASEDIR/start.sh"

sleep 5
echo "yes" | "$BASEDIR/init.sh"
