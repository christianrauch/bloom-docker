FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN apt update; \
    apt -y install --no-install-recommends gettext-base; \
    rm -rf /var/lib/apt/lists/*

# copy and configure the ROS repos file
COPY ./ros.sources.in /tmp
RUN . /etc/os-release; \
    export SUITE=$VERSION_CODENAME; \
    envsubst < /tmp/ros.sources.in > /etc/apt/sources.list.d/ros.sources

RUN apt update; \
    apt -y install --no-install-recommends python3-bloom python3-pip devscripts equivs wget; \
    apt -y purge python3-bloom; \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade git+https://github.com/christianrauch/bloom.git@meson_wrap_mode

RUN rosdep init; rosdep update

COPY ./bloom.sh /
ENTRYPOINT ["/bloom.sh"]
