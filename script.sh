#!/bin/sh
HNAME=`exec hostname`
IP=`exec ip address | grep 'inet ' | grep -v '127.0.0.1'| cut -d. --fields=1,2,3,4 | awk '{ print $2 }' | cut -d/ -f1 | awk '{print $1}'`
#echo "current ip:" $IP
#echo "current hostname:" $HNAME
sed -i '/'$HNAME'/c\'$IP'\t\t'$HNAME /etc/hosts
