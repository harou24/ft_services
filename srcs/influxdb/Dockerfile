FROM	alpine:3.12

RUN	apk update && apk upgrade

RUN	apk add influxdb
COPY	influxdb.conf /etc/influxdb/influxdb.conf

RUN	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY	telegraf.conf /etc/telegraf/telegraf.conf

RUN	mkdir -p /setup
COPY	start.sh /setup/start.sh

VOLUME	[ "/var/lib/influxdb" ]

EXPOSE	8086

ENTRYPOINT	sh /setup/start.sh
