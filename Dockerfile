FROM alpine
MAINTAINER tacki@posteo.de

RUN apk add --no-cache \
    bash apache2 apache2-webdav apache2-utils cifs-utils

ADD dav.conf /etc/apache2/conf.d/
ADD run.sh /
RUN chmod 750 /run.sh

EXPOSE 80

CMD ["/run.sh"]
