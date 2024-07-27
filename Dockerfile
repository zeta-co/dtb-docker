ARG PYTHON_VERSION=3.9.19
FROM python:${PYTHON_VERSION}-slim

ARG SPARK_VERSION=3.3.4
ARG DELTA_VERSION=2.3.0

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openjdk-17-jre-headless \
        ca-certificates-java && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install pyspark==${SPARK_VERSION} delta-spark==${DELTA_VERSION}