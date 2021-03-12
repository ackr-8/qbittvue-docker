#### Environment:

| Environment | Default value |
|-------------|---------------|
| PEER_PORT | 6881            |
| WEB_PORT  | 8080            |
| UID       | 1000            |
| GID       | 1000            |

##### username & password

- username: admin
- password: adminadmin

#### Volume

- /data
- /config
#### Creating an instance:

    docker run \
        -d \
        --name qbittorrent \
        -p 6881:6881 \
        -p 6881:6881/udp \
        -p 8080:8080 \
        -v /path/data:/data \
        -v /path/config:/config\
        qbittvue:0.2

#### Compose example:

    qbittorrent:
        image: qbittvue:0.2
        ports:
            - "9090:9090"
            - "6881:6881"
            - "6881:6881/udp"
        volumes:
            - /path/data:/data
            - /path/config:/config
        environment:
            - UID=1000
            - GID=1000
      restart: always
