FROM	alpine:3.12

RUN	apk update && apk upgrade

RUN	apk add openssh
RUN	apk add nginx
RUN	apk add openssl

RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	adduser -D ssh
RUN	echo "ssh:hellossh" | chpasswd
RUN	ssh-keygen -A

RUN	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=NL/ST=Amserdam/O=Codam-42/CN=harou" \
		-keyout /etc/ssl/private/certificate.key \
		-out /etc/ssl/certs/certificate.crt

RUN	mkdir -p /var/www/localhost
COPY	index.html /var/www/localhost/index.html

RUN	mkdir -p /run/nginx
RUN	rm		/etc/nginx/conf.d/default.conf
COPY 	localhost.conf	/etc/nginx/conf.d/localhost.conf

ADD	start.sh /setup/start.sh

EXPOSE	22 80 443

ENTRYPOINT	sh /setup/start.sh
