FROM	alpine:3.12

RUN	apk update && apk upgrade

RUN	apk add mariadb mariadb-common mariadb-client
RUN	mkdir -p /run/mysqld && touch /run/mysqld/mysqld.sock
COPY	create_users.sql /setup/create_users.sql

RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	mkdir -p /setup
COPY	start.sh /setup/start.sh

VOLUME [ "/var/lib/mysql" ]

EXPOSE	3306

ENTRYPOINT	sh /setup/start.sh
