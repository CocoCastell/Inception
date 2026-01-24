FROM alpine:3.22.2

WORKDIR /var/www

RUN apk update && apk upgrade && apk add --no-cache php84-fpm php84 php84-mysqli php84-gd php84-pdo_mysql mariadb-client 

COPY ./tools/wordpress-entrypoint.sh /tmp/
RUN chmod +x /tmp/wordpress-entrypoint.sh

ENTRYPOINT ["/tmp/wordpress-entrypoint.sh"]
