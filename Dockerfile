# ################################################################
# NAME: Dockerfile
# DESC: Docker file to create nginx image.
#
# LOG:
# yyyy/mm/dd [name] [version]: [notes]
# 2014/10/21 cgwong [v0.1.0]: Initial creation.
# ################################################################

FROM dockerfile/ubuntu
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

# Install nginx
##ENV NGINX_VERSION 1.7.6
##ENV NGINX_VERSION latest
RUN wget -qO - http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN apt-get -y update && apt-get install -y \
    apache2-utils \
    nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Expose persistent configuration storage areas
VOLUME ["/usr/share/nginx/html"]
VOLUME ["/etc/nginx"]

# Listen for connections on HTTP port/interface: 80
EXPOSE 80
# Listen for connections on HTTPS port/interface: 443
EXPOSE 443
