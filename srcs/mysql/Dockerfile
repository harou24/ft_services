FROM	alpine

RUN	apk update

RUN	apk add --no-cache mysql mysql-client

RUN	adduser -D 'harou42' -g mysql

COPY 	srcs/my.cnf /etc/
COPY	srcs/start.sh .
VOLUME	/var/lib/mysql

EXPOSE	3306

ENTRYPOINT	sh start.sh
