FROM alpine
MAINTAINER tacki@posteo.de

RUN apk add --no-cache \
    bash apache2 apache2-webdav apache2-utils cifs-utils multitail

RUN mkdir -p /var/lib/dav \
    && mkdir -p /run/apache2 \
    && mkdir -p /var/webdav \
    && chown apache:apache /var/lib/dav \
    && chmod 755 /var/lib/dav

ADD dav.conf /etc/apache2/conf.d/
ADD run.sh /
RUN chmod 750 /run.sh

EXPOSE 80 443

CMD ["/run.sh"]
