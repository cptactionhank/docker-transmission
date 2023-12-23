FROM alpine:latest
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

RUN apk add transmission-daemon

VOLUME ["/var/lib/transmission-daemon"]

EXPOSE 9091 51413/tcp 51413/udp

ENTRYPOINT ["transmission-daemon", "--foreground", "--config-dir", "/var/lib/transmission-daemon/info", "--log-error"]
