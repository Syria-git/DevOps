FROM ubuntu:22.04

ARG http_proxy
ARG https_proxy

RUN apt-get update && apt-get install -y \
    zip unzip curl git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
