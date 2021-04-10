FROM	alpine

RUN	apk update

RUN	apk add --no-cache influxdb 

COPY	srcs/start.sh .

EXPOSE	8086

ENTRYPOINT	sh start.sh
