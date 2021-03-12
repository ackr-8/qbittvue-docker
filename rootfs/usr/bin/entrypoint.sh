#! /bin/sh
set -e

[[ "$DEBUG" == "true" ]] && set -x

getent group qbittorrent >/dev/null || addgroup -g ${GID} qbittorrent
getent passwd qbittorrent >/dev/null || adduser -h /config -s /bin/sh -G qbittorrent -D -u ${UID} qbittorrent

mkdir -p /config/.config/qBittorrent

[[ ! -f /config/.config/qBittorrent/qBittorrent.conf ]] && cp /etc/qBittorrent.conf /config/.config/qBittorrent/ && cp -r /etc/vuejs/ /config/.config/qBittorrent
sed -i "s|Connection\\\PortRangeMin=.*|Connection\\\PortRangeMin=${PEER_PORT}|i" /config/.config/qBittorrent/qBittorrent.conf
sed -i "s|WebUI\\\Port=.*|WebUI\\\Port=${WEB_PORT}|i" /config/.config/qBittorrent/qBittorrent.conf

chown -R qbittorrent:qbittorrent /config

exec su-exec qbittorrent:qbittorrent "$@"
