FROM --platform=linux/arm64 python:3.10-slim

# install necessary dependencies for PySpark configuration
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     curl \
#     wget \
#     ca-certificates \
#     gnupg \
#     procps \
#     iproute2 \
#     openjdk-17-jre-headless && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# set environment variables
ENV JAVA_HOME="/usr/lib/jvm/default-java"
ENV SPARK_HOME=/opt/spark
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV PATH="/opt/spark/sbin:/opt/spark/bin:${PATH}"
ENV PYSPARK_PYTHON=python3

ENV SPARK_VERSION="3.5.6"

# make ports reachable
EXPOSE 8080
EXPOSE 7077

# Download apache spark
# RUN curl -L -o /tmp/spark.tgz https://dlcdn.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz && \
#     tar -xzf /tmp/spark.tgz -C /opt && \
#     mv /opt/spark-$SPARK_VERSION-bin-hadoop3 /opt/spark && \
#     rm /tmp/spark.tgz

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-17-jre-headless curl wget ca-certificates gnupg procps iproute2 && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L -o /tmp/spark.tgz https://dlcdn.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz && \
    tar -xzf /tmp/spark.tgz -C /opt && \
    mv /opt/spark-$SPARK_VERSION-bin-hadoop3 /opt/spark && \
    rm /tmp/spark.tgz

# Install PySpark
RUN pip install pyspark

RUN rm -rf $SPARK_HOME/examples \
           $SPARK_HOME/jars/*mesos* \
           $SPARK_HOME/jars/*kubernetes* \
           $SPARK_HOME/jars/*hive* \
           $SPARK_HOME/jars/*avro* \
           $SPARK_HOME/jars/*parquet* \
           $SPARK_HOME/jars/*orc*

# place spark-env.sh in correct place
COPY conf/spark-env.sh $SPARK_HOME/conf/spark-env.sh
RUN chmod +x $SPARK_HOME/conf/spark-env.sh


# move start-up script to correct location in container
COPY worker/start-worker.sh /opt/start-worker.sh
RUN chmod +x /opt/start-worker.sh

# Default command starts Spark worker
CMD ["/opt/start-worker.sh"]