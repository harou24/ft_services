FROM	alpine:3.12

RUN	apk update && apk upgrade

RUN	apk add nginx
RUN	mkdir -p /run/nginx
RUN	rm		/etc/nginx/conf.d/default.conf
COPY 	localhost.conf	/etc/nginx/conf.d/localhost.conf

RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	apk add openssh
RUN	adduser -D ssh
RUN	echo "ssh:hellossh" | chpasswd
RUN	ssh-keygen -A

RUN	apk add openssl
RUN	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=NL/ST=Amserdam/O=Codam-42/CN=harou" \
		-keyout /etc/ssl/private/certificate.key \
		-out /etc/ssl/certs/certificate.crt

RUN	mkdir -p /var/www/localhost
COPY	index.html /var/www/localhost/index.html

COPY	start.sh /setup/start.sh

EXPOSE	22 80 443

ENTRYPOINT	sh /setup/start.sh
