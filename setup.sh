#!/bin/sh

# DELETE PREVIOUS SETUP
kubectl delete -f srcs/.
minikube delete --all

# USERNAMES AND PASSWORDS
FTPS_USERNAME=ftps
FTPS_PASSWORD=helloWorld
MYSQL_USERNAME=mysql
MYSQL_PASSWORD=helloWorld
SSH_USERNAME=ssh
SSH_PASSWORD=helloWorld
GRAFANA_USERNAME=grafana
GRAFANA_PASSWORD=helloWorld

# STARTING MINIKUBE
minikube start --vm-driver=virtualbox --addons dashboard --addons metallb

# SWITCHING DOCKER ENV
eval $(minikube docker-env)

# BUILDING IMAGES
docker build -t ft_services_mysql srcs/mysql/. --build-arg MYSQL_USERNAME=$MYSQL_USERNAME --build-arg MYSQL_PASSWORD=$MYSQL_PASSWORD
docker build -t ft_services_ftps srcs/ftps/. --build-arg EXTERNAL_IP=192.168.99.240 --build-arg FTPS_USERNAME=$FTPS_USERNAME --build-arg FTPS_PASSWORD=$FTPS_PASSWORD
docker build -t ft_services_phpmyadmin srcs/phpmyadmin/.
docker build -t ft_services_wordpress srcs/wordpress/.
docker build -t ft_services_nginx srcs/nginx/. --build-arg SSH_USERNAME=$SSH_USERNAME --build-arg SSH_PASSWORD=$SSH_PASSWORD
docker build -t ft_services_influxdb srcs/influxdb/.
docker build -t ft_services_grafana srcs/grafana/.

# APPLYING CONFIG FILES
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml

# TO MAKE SURE ALL SERVICES HAVE STARTED
sleep 10

# IMPORTING WORDPRESS CONFIG TO MYSQL DATABASE
kubectl exec -i `kubectl get pods | grep -o "\S*mysql\S*"` -- mysql wordpress -u root < srcs/mysql/wordpress.sql
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
# OPENING DASHBOARD IN WEB BROWSER
minikube dashboard
