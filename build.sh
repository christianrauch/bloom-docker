#!/usr/bin/env bash

# generate a repos file in deb822 format
$(source /etc/os-release; envsubst < ros.sources.in > ros.sources)
