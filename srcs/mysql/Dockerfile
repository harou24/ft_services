FROM	alpine:3.12

ARG	MYSQL_USERNAME
ARG	MYSQL_PASSWORD

RUN	apk update && apk upgrade

RUN	apk add mariadb mariadb-common mariadb-client

RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN mkdir -p /run/mysqld && touch /run/mysqld/mysqld.sock

RUN mkdir -p /setup
COPY wordpress.sql /setup/wordpress.sql
COPY start.sh /setup/start.sh

RUN sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" /setup/wordpress.sql
RUN sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /setup/wordpress.sql

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

ENTRYPOINT sh /setup/start.sh
