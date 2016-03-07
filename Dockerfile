FROM bbania/centos:base
MAINTAINER "Bart Bania" <contact@bartbania.com>

ENV NGINX_VERSION 1.8.1-1.el7.ngx

COPY ./configs/nginx.repo /etc/yum.repos.d/nginx.repo

RUN rpm --import http://nginx.org/keys/nginx_signing.key && \
    yum -q -y install ca-certificates nginx-${NGINX_VERSION} gettext && \
    yum -q clean all

VOLUME /etc/nginx/

EXPOSE 80 443

CMD ["nginx", "&"]

