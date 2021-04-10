FROM	alpine

RUN	apk update && apk add --no-cache nginx openssl

RUN	adduser -D 'www' -g www

RUN	mkdir /www && chmod +x /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www && \
		mkdir -p /run/nginx

COPY	srcs/index.html /www/

RUN	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=NL/ST=Amserdam/O=Codam-42/CN=harou" \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt

COPY	srcs/nginx.conf /etc/nginx/
COPY	srcs/start.sh .
RUN	chmod +x start.sh

EXPOSE 80 443

ENTRYPOINT	sh start.sh
