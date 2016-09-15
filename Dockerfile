# Stratio distribution Dockerfile
#
# VERSION       0.3.0

FROM qa.stratio.com/stratio/ubuntu-base:16.04
MAINTAINER Stratio Crossdata team

COPY spark-1.6.2-bin-spark-1.6.2_hadoop-2.6_scala-2.11.tgz /tmp/spark.tgz

RUN tar zxvf /tmp/spark.tgz -C /tmp

RUN mkdir -p /opt/sds/

RUN mv /tmp/spark-1.6.2-bin-spark-1.6.2_hadoop-2.6_scala-2.11 /opt/sds/spark-1.6.2-bin-spark-1.6.2_hadoop-2.6_scala-2.11

RUN ln -s /opt/sds/spark-1.6.2-bin-spark-1.6.2_hadoop-2.6_scala-2.11 /opt/sds/spark-crossdata

RUN rm -rf /tmp/spark*

COPY mesos.tar.gz /usr/lib/mesos.tar.gz

RUN tar zxvf /usr/lib/mesos.tar.gz
RUN ls -l /usr/lib/
RUN rm -rf /usr/lib/mesos.tar.gz

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV SPARK_HOME /opt/sds/spark-crossdata

CMD tail -f /var/log/*