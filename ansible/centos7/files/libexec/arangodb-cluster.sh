#!/bin/sh
exec /usr/bin/arangodb \
     --starter.data-dir=/var/lib/arangodb3-cluster \
     --log.dir=/var/log/arangodb3 \
     `cat /etc/arangodb3/cluster.conf`
