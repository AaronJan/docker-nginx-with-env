#!/bin/bash
set -e

rm -Rf /etc/nginx
cp -R /etc/nginx_readonly /etc/nginx

sed -i "s/<PHPFPM_HOST>/${PHPFPM_PORT_9000_TCP_ADDR}/g;s/<PHPFPM_PORT>/${PHPFPM_PORT_9000_TCP_PORT}/g" /etc/nginx/conf.d/vhost.conf;

exec "$@"