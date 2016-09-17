#!/usr/bin/env bash
export SPARK_MASTER_IP=`cat /etc/hosts | grep \`hostname\` | awk 'NR==1 {print $1}'`
export SPARK_LOCAL_IP=`cat /etc/hosts | grep \`hostname\` | awk 'NR==1 {print $1}'`
/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -i $SPARK_LOCAL_IP "$@"
/bin/bash
