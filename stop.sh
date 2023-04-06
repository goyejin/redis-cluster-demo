#!/usr/bin/env sh

WORKDIR="$(pwd)"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

echo "Kill processes:"
ps -ef | grep redis-server | grep -v grep
ps -ef | grep redis-server | grep -v grep | awk '{ print $2 }' | xargs kill 2>/dev/null
