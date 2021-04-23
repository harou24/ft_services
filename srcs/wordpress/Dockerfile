FROM	alpine:3.12

RUN	apk update && apk upgrade

RUN	apk add openrc

RUN	apk add nginx
RUN	mkdir -p /run/nginx
RUN	rm 		/etc/nginx/conf.d/default.conf
COPY	wordpress.conf	/etc/nginx/conf.d/wordpress.conf

RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session

RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	wget https://wordpress.org/latest.tar.gz \
		&& tar -xvf latest.tar.gz \
		&& mv wordpress /var/www/ \
		&& rm -rf /var/cache/apk/*
COPY	wp-config.php	/var/www/wordpress/

COPY	start.sh /setup/start.sh

EXPOSE	5050

ENTRYPOINT	sh /setup/start.sh
