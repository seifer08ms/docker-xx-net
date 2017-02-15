# Docker-XX-net

## Build

Run the following code in the path of repository to build a docker image.

`docker build -t seifer08ms/xx-net . `

## Run

Using `docker run` command to create a container named `xx-net`.

`docker run --name=xx-net --restart=always -d -v $PWD/data:/opt/XX-Net/data -v $PWD/code:/opt/XX-Net/code -p 8085:8085 -p 8087:8087 seifer08ms/xx-net`

## Access from host

The container exposed 8085 and 8087 ports for config and connection. 

### Remote access
Modify XX-Net/data/launcher/config.yaml
```shell
modules:{
  launcher:{ allow_remote_connect:1 }
```

### GAE_proxy service for remote hosts
Add XX-Net/data/gae_proxy/manual.ini

```shell
[listen]
ip = 0.0.0.0
```

Now we can access control page for the container with `http://127.0.0.1:8085`

## Access from other container

Using `docker run --link` to connect xx-net with other client container.

`docker run --name ${CONTAINER_NAME} --link ${XX_NET_CONTAINER_NAME}:proxy_server -d --restart=always  ${IMAGE_NAME}`

In the client container, using `http://proxy_server:8087` to access xx-net service.

## Contribute

[https://github.com/XX-net/XX-Net/wiki/How-to-contribute](https://github.com/XX-net/XX-Net/wiki/How-to-contribute)

