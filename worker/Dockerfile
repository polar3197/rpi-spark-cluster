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

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV SPARK_HOME=/opt/spark
ENV PATH="/opt/spark/sbin:/opt/spark/bin:${PATH}"
ENV SPARK_HOME="/opt/spark"
ENV PYSPARK_PYTHON=python3

# Add this after installing system packages
RUN curl -L -o /tmp/spark.tgz https://archive.apache.org/dist/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz && \
    tar -xzf /tmp/spark.tgz -C /opt && \
    mv /opt/spark-3.5.0-bin-hadoop3 /opt/spark && \
    rm /tmp/spark.tgz

# Install PySpark
RUN pip install pyspark

# spark env setup
COPY config/pyspark-m.sh $SPARK_HOME/conf/
RUN chmod +x $SPARK_HOME/conf/pyspark-m.sh

# spark defaults setup
COPY config/spark-defaults.conf "$SPARK_HOME/conf"

COPY worker/start-worker.sh /opt/start-worker.sh
RUN chmod +x /opt/start-worker.sh

# Default command starts Spark worker
CMD ["/opt/start-worker.sh"]
