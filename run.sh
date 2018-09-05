#!/bin/bash

htpasswd -cb /etc/apache2/webdav.password $USERNAME $PASSWORD
chown root:apache /etc/apache2/webdav.password
chmod 640 /etc/apache2/webdav.password

mount.cifs $SHARE /var/webdav -o username=$USERNAME,password=$PASSWORD,uid=apache

httpd -D BACKGROUND -e info
multitail -ci green /var/log/apache2/access.log -ci red -I /var/log/apache2/error.log
