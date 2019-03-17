#!/bin/sh
set -e

BASEDIR=/var/lib/arangodb3-cluster

cd "$BASEDIR"
exec /usr/bin/arangodb \
     --starter.data-dir="$BASEDIR" \
     --log.dir=/var/log/arangodb3 \
     `cat /etc/arangodb3/cluster.conf`
