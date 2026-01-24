FROM alpine:3.22.2

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client && mkdir /run/mysqld && chown mysql:mysql /run/mysqld

COPY ./tools/mariadb-entrypoint.sh /tmp
COPY ./conf/x99-custom.cnf /etc/my.cnf.d/
RUN chmod +x /tmp/mariadb-entrypoint.sh

ENTRYPOINT ["/tmp/mariadb-entrypoint.sh"]

