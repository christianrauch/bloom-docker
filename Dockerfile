FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# copy the repos file
COPY ./ros.sources /etc/apt/sources.list.d/

RUN apt update

RUN apt -y install --no-install-recommends python3-bloom
