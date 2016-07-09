FROM alpine:3.4
MAINTAINER Niclas Mietz niclas@mietz.io

ENV RAINLOOP_VERSION 1.10.1.127
ENV RAINLOOP_HOME /var/www/rainloop
ENV RAINLOOP_EDITION  rainloop-community-latest.zip
ENV RAINLOOP_DOWNLOAD http://repository.rainloop.net/v2/webmail/${RAINLOOP_EDITION}
ENV REQUIRED_PACKAGES apache2 php-apache2 php-openssl php-xml php-json php-iconv php-curl php-pdo_mysql php-pdo_pgsql php-pdo_sqlite php-dom php-zlib
ENV REQUIRED_PACKAGES apache2 php5-apache2 php5-openssl php5-xml php5-json php5-iconv php5-curl php5-pdo_mysql php5-pdo_pgsql php5-pdo_sqlite php5-dom php5-zlib

RUN \
  apk add -U $REQUIRED_PACKAGES && \
  mkdir -p /run/apache2 && \
  rm -fr /var/cache/apk/* && \
  rm -fr /usr/bin/php


RUN apk add -U unzip findutils && \
    mkdir -p ${RAINLOOP_HOME}  && \
    cd ${RAINLOOP_HOME} && \
    curl -O ${RAINLOOP_DOWNLOAD} && \
    unzip ${RAINLOOP_EDITION} && \
    rm ${RAINLOOP_EDITION} && \
    apk del --purge unzip && \
    rm -fr /var/cache/apk/* && \
    rm -fr /tmp/*

ADD httpd.conf /etc/apache2/httpd.conf

WORKDIR $RAINLOOP_HOME

EXPOSE 80
VOLUME /var/www/rainloop/data

ADD docker-entrypoint.sh /
ENTRYPOINT  ["/docker-entrypoint.sh"]
