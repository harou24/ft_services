FROM	alpine:3.12

RUN	apk update && apk upgrade

RUN	apk add wget
RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN	apk add libc6-compat --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

COPY	telegraf.conf /etc/telegraf/telegraf.conf

ADD	https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz /
RUN	tar -zxvf grafana-7.5.4.linux-amd64.tar.gz \
		&& rm -f grafana-7.5.4.linux-amd64.tar.gz

RUN	mv grafana-7.5.4/ grafana/
RUN	mv grafana/bin/* /usr/local/bin/

RUN	mkdir -p /setup
COPY	start.sh /setup/start.sh
COPY 	grafana.db /grafana/data/grafana.db

EXPOSE	3000

ENTRYPOINT sh /setup/start.sh

