FROM	alpine:3.12

ARG	EXTERNAL_IP

RUN	apk update && apk upgrade

RUN	apk add pure-ftpd \
		--repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
		--allow-untrusted

RUN	apk add openssl
RUN	mkdir -p /etc/ssl/private
RUN	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=NL/ST=Amserdam/O=Codam-42/CN=harou" \
		-keyout /etc/ssl/private/pure-ftpd.pem \
		-out /etc/ssl/private/pure-ftpd.pem

RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY 	telegraf.conf /etc/telegraf/telegraf.conf

RUN	adduser -D "ftps"
RUN	echo "ftps:helloftps" | chpasswd

ENV	EXTERNAL_IP=${EXTERNAL_IP}

RUN	mkdir -p /setup
COPY	start.sh /setup/start.sh

EXPOSE	20 21 30000

ENTRYPOINT	sh /setup/start.sh
