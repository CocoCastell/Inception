FROM alpine:3.23.0

RUN apk update && apk upgrade && apk add nginx openssl && chown nginx:nginx /var/www && rm -rf /var/www/localhost

RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=Catalunya/L=Barcelona/O=42/OU=42/CN=cochatel.42.fr"

COPY ./conf/wordpress.conf /etc/nginx/http.d/

EXPOSE 443

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
