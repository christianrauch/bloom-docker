#!/usr/bin/env bash

set -e

apt update

pushd /bloom/package
bloom-generate rosdebian --ros-distro jazzy
mk-build-deps
apt install -y --no-install-recommends ./ros-jazzy-*-build-deps_*_all.deb
dpkg-buildpackage -b
popd
