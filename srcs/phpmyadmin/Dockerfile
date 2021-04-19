FROM	alpine:3.12

RUN 	apk update && apk upgrade

RUN 	apk add openrc
RUN 	apk add nginx
RUN 	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
		php7-curl php7-mbstring php7-json php7-session

RUN 	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
		&& mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin && mv phpmyadmin /var/www  \
		&& rm -rf /var/cache/apk/*

COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	mkdir -p /run/nginx
RUN	rm /etc/nginx/conf.d/default.conf
COPY	phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf

COPY	start.sh /setup/start.sh

EXPOSE	5000

ENTRYPOINT	sh /setup/start.sh
