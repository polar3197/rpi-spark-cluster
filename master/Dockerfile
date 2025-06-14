FROM python:3.10-slim

# install necessary dependencies for PySpark configuration
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    ca-certificates \
    gnupg \
    procps \
    iproute2 \
    default-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# set environment variables
ENV JAVA_HOME="/usr/lib/jvm/default-java"
ENV SPARK_HOME=/opt/spark
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV PATH="/opt/spark/sbin:/opt/spark/bin:${PATH}"
ENV PYSPARK_PYTHON=python3

# Download apache spark
RUN curl -L -o /tmp/spark.tgz https://dlcdn.apache.org/spark/spark-4.0.0/spark-4.0.0-bin-hadoop3.tgz && \
    tar -xzf /tmp/spark.tgz -C /opt && \
    mv /opt/spark-4.0.0-bin-hadoop3 /opt/spark && \
    rm /tmp/spark.tgz

# Install PySpark
RUN pip install pyspark

# place spark-env.sh in correct place
COPY conf/spark-env.sh $SPARK_HOME/conf/spark-env.sh
RUN chmod +x $SPARK_HOME/conf/spark-env.sh

# move start-up script to correct location in container
COPY master/start-master.sh /opt/start-master.sh
RUN chmod +x /opt/start-master.sh

CMD ["/opt/start-master.sh"]