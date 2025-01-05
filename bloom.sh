#!/usr/bin/env bash

set -e

apt update

pushd /bloom/package
bloom-generate rosdebian --ros-distro jazzy
# bump compat to 10 to enable parallel builds
echo "10" > debian/compat
mk-build-deps
apt install -y --no-install-recommends ./ros-jazzy-*-build-deps_*_all.deb
dpkg-buildpackage -b
popd
