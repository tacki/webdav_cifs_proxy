#!/bin/bash

mkdir -p /var/lib/dav \
mkdir -p /run/apache2 \
mkdir -p /var/webdav \
chown apache:apache /var/lib/dav \
chmod 755 /var/lib/dav
ln -s /dev/stdout /var/log/apache2/access.log
ln -s /dev/stderr /var/log/apache2/error.log

htpasswd -cb /etc/apache2/webdav.password $USERNAME $PASSWORD
chown root:apache /etc/apache2/webdav.password
chmod 640 /etc/apache2/webdav.password

mount.cifs $SHARE /var/webdav -o username=$USERNAME,password=$PASSWORD,uid=apache

httpd -D FOREGROUND -e info
