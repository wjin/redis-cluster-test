#!/bin/bash

CURDIR=`pwd`

PIDS=`ps -ef | grep 'redis-server' | grep -v "grep" | awk '{ print $2; }'`
for pid in $PIDS
do
	kill -9 $pid > /dev/null 2>&1
done

find . -name "*.aof" | xargs rm > /dev/null 2>&1
find . -name "*.rdb" | xargs rm > /dev/null 2>&1
find . -name "nodes.conf" | xargs rm > /dev/null 2>&1

exit 0
