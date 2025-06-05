FROM --platform=linux/arm64 python:3.10-slim

# Install Java 11 and required system utilities
# Install dependencies and Java
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    ca-certificates \
    gnupg \
    software-properties-common \
    procps \
    git \
    vim \
    default-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH="$JAVA_HOME/bin:$PATH"

# Add this after installing system packages
ENV SPARK_VERSION=3.5.0
ENV HADOOP_VERSION=3
ENV SPARK_HOME=/opt/spark

ENV SPARK_MASTER_URL=spark://spark-master:7077

RUN curl -L -o /tmp/spark.tgz https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xzf /tmp/spark.tgz -C /opt && \
    mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark && \
    rm /tmp/spark.tgz

ENV PATH="$SPARK_HOME/bin:$PATH"

# Install PySpark
RUN pip install pyspark

# spark defaults setup
COPY config/spark-defaults.conf $SPARK_HOME/conf/
RUN chmod +x $SPARK_HOME/conf/spark-defaults.conf

# Copy the startup script
COPY worker/start-worker.sh /opt/start-worker.sh
RUN chmod +x /opt/start-worker.sh

# Default command starts Spark worker
CMD ["/opt/start-worker.sh"]
