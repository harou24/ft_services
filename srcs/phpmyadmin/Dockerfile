FROM	alpine:3.12

RUN 	apk update && apk upgrade

RUN 	apk add openrc

RUN 	apk add nginx
RUN	mkdir -p /run/nginx
RUN	rm /etc/nginx/conf.d/default.conf
COPY	phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf

RUN 	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN 	apk add --no-cache php7 php7-fpm php7-mysqli php7-mbstring php7-session php7-json php7-iconv php7-xml
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz \
		&& tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz \
		&& mv phpMyAdmin-5.1.0-all-languages phpmyadmin 
COPY	config.inc.php phpmyadmin/
RUN	cp -r phpmyadmin /var/www/
RUN	rm -rf phpmyadmin

COPY	start.sh /setup/start.sh

EXPOSE	5000

ENTRYPOINT	sh /setup/start.sh
