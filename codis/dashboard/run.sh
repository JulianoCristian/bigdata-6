#!/bin/bash

HOST_IP=`ip addr show eth0 | grep "inet " | awk '{print $2}'|awk -F'/' '{print $1}'`
sed -i "s/LOCAL_IP/${HOST_IP}/g" $CODIS_HOME/codisconf/config.ini
sed -i "s/ZOOKEEPER_IP/${ZOOKEEPER}/g" $CODIS_HOME/codisconf/config.ini
sed -i "s/PRODUCT_NAME/${PRODUCT}/g" $CODIS_HOME/codisconf/config.ini

$CODIS_HOME/bin/codis-config -c $CODIS_HOME/codisconf/config.ini dashboard --addr=${HOST_IP}:18087 >> $CODIS_HOME/codislog/${PRODUCT}.log 2>&1
