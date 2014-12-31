#!/bin/bash

CURDIR=`pwd`
REDIS="$CURDIR/redis-server"
REDIS_CONF="$CURDIR/redis.conf"
TRIB="$CURDIR/redis-trib.rb"

# config cluster
TOTAL_NODE=12
SLAVE_PER_MASTER=2
PORT_BEGIN=10000
IP='127.0.0.1'

for ((i = $PORT_BEGIN; i < $PORT_BEGIN + $TOTAL_NODE; i++))
do
	mkdir -p $i
	cp $REDIS_CONF $i
	echo "port $i" >> $i/redis.conf
	cd $i && $REDIS ./redis.conf > /dev/null 2>&1 &
	IP_PORT_PAIR="$IP_PORT_PAIR $IP:$i"
done

yes yes | $TRIB create --replicas $SLAVE_PER_MASTER $IP_PORT_PAIR

exit 0
