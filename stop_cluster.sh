#!/bin/bash

CURDIR=`pwd`

PIDS=`ps -ef | grep 'redis-server' | grep -v "grep" | awk '{ print $2; }'`
for pid in $PIDS
do
	kill -9 $pid > /dev/null 2>&1
done

DIRS=`ls -l | grep ^d | awk '{ print $9 }'`
rm -rf $DIRS

exit 0
