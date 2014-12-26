#!/bin/bash

CURDIR=`pwd`
REDIS="$CURDIR/redis-server"
TRIB="$CURDIR/redis-trib.rb"

DIRS=`ls -l | grep ^d | awk '{ print $9 }'`

for dir in $DIRS
do
	cd $dir && $REDIS ./redis.conf > /dev/null 2>&1 &
done

$TRIB create --replicas 1 127.0.0.1:7000 127.0.0.1:7001 \
127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005

exit 0
