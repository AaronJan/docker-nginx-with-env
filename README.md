docker-nginx-with-env
=====================

Simple nginx image with ENV(environment) variables auto-replace. Using official Nginx docker image.

## Intro

This image is now in a very early stage, it can only replace php-fpm environment variables.

But, it's usable if you follow the rules.

## Todo

1.Make this can replace every configure file in the `conf.d` folder
2.Support other ENV configures(?? other then PHP? Don't know what's that yet)
3.Still thinking...

##How to use

1.Pull this image:[from Docker](https://registry.hub.docker.com/u/aaronjan/nginx-with-env/)

2.Make your own nginx configure folder, looks like this:

```
conf.d/
  vhost.conf     # This is very important, this image can only replace placeholders in this file
fastcgi_params
koi-utf
koi-win
mime.types
nginx.conf       # This configure file will include the files in the folder `conf.d/`
scgi_params
uwsgi_params
win-utf
```

3.Start php-fpm container

4.Start this image link with php-fpm container:

docker run -d -p 80:80 --link [your php-fpm container]:phpfpm --volumes-from web_server_php-fpm --name nginx -v [your nginx configure folder]:/etc/nginx_readonly:ro -v [your www folder]:/usr/share/nginx/html:ro aaronjan/nginx-with-env:latest

5.Boom. You're good to go.
