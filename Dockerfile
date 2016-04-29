FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q --force-yes build-essential libncurses5-dev gawk git subversion libssl-dev gettext unzip sudo wget python

RUN useradd -d /home/openwrt -m -s /bin/bash openwrt
RUN echo "openwrt ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/openwrt
RUN chmod 0440 /etc/sudoers.d/openwrt

USER openwrt

WORKDIR /home/openwrt
RUN git clone https://github.com/akent/openwrt-15.05.git
WORKDIR /home/openwrt/openwrt-15.05
COPY dotconfig .config
RUN make -j`nproc` 
