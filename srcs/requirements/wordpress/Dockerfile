FROM alpine:3.23.0

WORKDIR /var/www

RUN apk update && apk upgrade && apk add --no-cache php84-fpm php84 php84-mysqli php84-phar php84-gd php84-pdo_mysql mariadb-client php-iconv php-mbstring
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wordpress-entrypoint.sh /tmp/
RUN chmod +x /tmp/wordpress-entrypoint.sh

ENTRYPOINT ["/tmp/wordpress-entrypoint.sh"]
