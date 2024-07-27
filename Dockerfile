ARG PYTHON_VERSION=3.9.19
FROM python:${PYTHON_VERSION}-slim

ARG SPARK_VERSION=3.3.4
ARG DELTA_VERSION=2.3.0

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install pyspark==${SPARK_VERSION} delta-spark==${DELTA_VERSION}
