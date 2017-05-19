FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

COPY bundle/ /bin/
COPY conf /etc/frp

WORKDIR /etc/frp

EXPOSE 6000 8080