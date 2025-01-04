#!/usr/bin/env bash

# generate a repos file in deb822 format
$(source /etc/os-release; export SUITE=$VERSION_CODENAME; envsubst < ros.sources.in > ros.sources)

docker build . --tag bloom
