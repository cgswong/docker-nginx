## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/cgswong/nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/cgswong/nginx/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull cgswong/nginx`

   (alternatively, you can build an image from Dockerfile: `docker build -t="cgswong/nginx" github.com/dockerfile/docker-nginx`)


### Usage

    docker run -d -p 80:80 cgswong/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx cgswong/nginx

After few seconds, open `http://<host>` to see the welcome page.
