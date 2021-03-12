FROM alpine:3.13

ARG VERSION

ENV PEER_PORT=6881 \
    WEB_PORT=9090 \
    UID=1000 \
    GID=1000

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
  qbittorrent-nox su-exec

COPY rootfs /

EXPOSE $PEER_PORT $PEER_PORT/udp $WEB_PORT

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/bin/qbittorrent-nox"]
