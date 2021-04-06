FROM	alpine

RUN	apk update && apk add --no-cache vsftpd openssl

RUN	mkdir -p /var/ftps && adduser -D -h /var/ftps harou42 && echo "harou42:helloWorld" | chpasswd

RUN	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=NL/ST=Amserdam/O=Codam-42/CN=harou" \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt

COPY	srcs/vsftpd.conf /etc/vsftpd/
COPY	srcs/start.sh /

EXPOSE	20 21 30000

ENTRYPOINT	sh start.sh
