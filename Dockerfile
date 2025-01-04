FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# copy the repos file
COPY ./ros.sources /etc/apt/sources.list.d/

RUN apt update

RUN apt -y install --no-install-recommends python3-bloom

# install libcamera build dependencies
# https://libcamera.org/getting-started.html
RUN apt -y install --no-install-recommends \
    g++ meson ninja-build pkg-config \
    libyaml-dev python3-yaml python3-ply python3-jinja2 \
    openssl \
    libudev-dev libevent-dev libdrm-dev libjpeg-dev libsdl2-dev
