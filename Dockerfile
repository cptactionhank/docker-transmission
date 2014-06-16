FROM ubuntu:trusty
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

# add launchpad transmission repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1 && \
    echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/launchpad-transmissionbt.list

# update repository lists and install transmission daemon
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yqV install transmission-daemon

# expose default transmission ports
EXPOSE 9091 51413/tcp 51413/udp

# mount transmission library directory for configuration and download stuff
VOLUME ["/var/lib/transmission-daemon"]

# Set the default command to run when starting the container
CMD ["transmission-daemon", "-g", "/var/lib/transmission-daemon/info", "--foreground", "--no-portmap", "--log-info"]
