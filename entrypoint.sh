#!/bin/sh
set -e
echo "user:${USER_PASSWD:?set USER_PASSWD}" | chpasswd
chown -R debian-tor:debian-tor /var/lib/tor/hidden_service
chmod 700 /var/lib/tor/hidden_service
service ssh start 2>/dev/null || /usr/sbin/sshd
nginx
exec runuser -u debian-tor -- tor -f /etc/tor/torrc