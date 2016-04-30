#!/bin/sh

chown -R apache:apache ${RAINLOOP_HOME}

sh -c "find . -type d -exec chmod 755 {} \;"
sh -c "find . -type f -exec chmod 644 {} \;"

exec /usr/sbin/httpd -D FOREGROUND
