#!/usr/bin/env bash
cd /usr/local/spark
export SPARK_LOCAL_IP=`cat /etc/hosts | grep \`hostname\` | awk 'NR==1 {print $1}'`
./bin/spark-class org.apache.spark.deploy.worker.Worker \
	spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_ENV_SPARK_MASTER_PORT} \
	--properties-file /spark-defaults.conf \
	-i $SPARK_LOCAL_IP \
	"$@"
