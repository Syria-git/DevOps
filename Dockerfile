FROM ubuntu:22.04
ENV http_proxy="http://10.0.68.19:8080"
ENV https_proxy="http://10.0.68.19:8080"
RUN apt-get update && apt-get install -y \
    zip unzip curl git \
    && rm -rf /var/lib/apt/lists/*
# هذا الـ Agent لا يحتاج لـ SSH لأنه يدار عبر docker exec
