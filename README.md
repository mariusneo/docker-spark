Docker container for spark stand alone cluster
=================================

This repository contains a set of scripts and configuration files to run a [Apache Spark](https://spark.apache.org/) standalone cluster from [Docker](https://www.docker.io/) container.

To run master execute:

```
./start-master.sh
```

To run worker execute:

```
./start-worker.sh
```
You can run multiple workers. Every worker would be able to find master by it's container name "spark_master".

To run spark shell against this cluster execute:

```
./spark-shell.sh
```
You can run multiple shells. Every shell would be able to find master by it's container name "spark_master".
 
If you like to run another container against this cluster, please read [explanation](http://sometechshit.blogspot.ru/2015/04/running-spark-standalone-cluster-in.html) how to prepare driver container.

If you need to increase memory or core count or pass any [other parameter](https://spark.apache.org/docs/latest/configuration.html) to spark, please use:

```
./spark-shell.sh --executor-memory 300M --total-executor-cores 3
./start-worker.sh --memory 700M
```

If you execute these images without scripts mentioned above, please:
* Remeber to name master container as spark_master for correct working on linkage.
* Read [documentation](http://sometechshit.blogspot.ru/2015/04/running-spark-standalone-cluster-in.html) to understand what's going on.

I also recommend you to use [Zeppelin](https://zeppelin.incubator.apache.org/) instead of spark shell for working with data. It has pleasant GUI and IPython like functionality. Please use docker [container](https://registry.hub.docker.com/u/epahomov/docker-zeppelin/) for that.


## Working examples:


The examples presented below should be executed from within ${SPARK_INSTALL_DIR}

In the examples below, the spark driver URL is set to be spark://172.17.0.1:7077 


```
./bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://172.17.0.1:7077 /examples/jars/spark-examples_2.11-2.0.0.jar 100
```


```
./bin/spark-submit --master spark://172.17.0.1:7077 examples/src/main/python/pi.py 100
```


