# Periodic rsync copy jobs

FROM debian:jessie
MAINTAINER gw0 [http://gw.tnode.com/] <gw.2016@tnode.com>

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /root/

# install packages
RUN apt-get update -qq \
 && apt-get install -y \
    cron \
    rsync \
    openssh-client

# remove default cron jobs
RUN rm -f /etc/cron.*/*

# expose interfaces
VOLUME /root/.ssh
VOLUME /data
