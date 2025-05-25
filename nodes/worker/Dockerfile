FROM --platform=linux/arm64 openjdk:17-slim

# Set a clear, stable working directory
WORKDIR /opt/app

ENV SPARK_VERSION=3.5.0
ENV HADOOP_VERSION=3
ENV SCALA_VERSION=2.13
ENV SPARK_HOME=/opt/spark

# Install Python and pip and curl
RUN apt-get update \
    && apt-get install -y python3 python3-pip curl git procps \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages pyspark

# Install full Spark binary
RUN curl -fL -o /tmp/spark.tgz https://archive.apache.org/dist/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3-scala2.13.tgz && \
    tar -xzf /tmp/spark.tgz -C /opt && \
    mv /opt/spark-3.5.0-bin-hadoop3-scala2.13 $SPARK_HOME && \
    rm /tmp/spark.tgz

# Copy the startup script
# COPY start-worker.sh /opt/start-worker.sh
# RUN chmod +x /opt/start-worker.sh

# Default command starts Spark worker
CMD ["/opt/start-worker.sh"]