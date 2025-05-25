FROM python:3.10-slim

# Install Java 11 and required system utilities
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk curl procps python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install PySpark
RUN pip install pyspark

# Optionally add your app code or entrypoint
CMD ["/opt/start-master.sh"]

