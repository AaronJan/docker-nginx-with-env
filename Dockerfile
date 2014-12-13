FROM nginx:1.7.8

MAINTAINER Aaron Jan <https://github.com/AaronJan/docker-nginx-with-env>

COPY docker-entrypoint.sh /entrypoint.sh

RUN ["chmod", "a+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
