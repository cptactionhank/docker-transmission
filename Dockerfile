FROM ubuntu:trusty
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1 \
    && echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu $(lsb_release -cs) main" \
       > /etc/apt/sources.list.d/launchpad-transmissionbt.list

RUN apt-get update -qq \
    && apt-get -yqq install transmission-daemon

VOLUME ["/var/lib/transmission-daemon"]

ENTRYPOINT ["transmission-daemon", "--foreground", "-g", "/var/lib/transmission-daemon/info", "--no-portmap", "--log-error"]

EXPOSE 9091 51413/tcp 51413/udp
