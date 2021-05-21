#!/bin/sh

# DELETE PREVIOUS SETUP
minikube delete

# STARTING MINIKUBE
minikube start --vm-driver=virtualbox --addons dashboard --addons metallb

# TO BE ABLE TO USE COMMANDS AS ARGUMENTS
eval $(minikube docker-env)

# BUILDING IMAGES
docker build -t ft_services_mysql srcs/mysql/. 
docker build -t ft_services_ftps srcs/ftps/. --build-arg EXTERNAL_IP=192.168.99.240 
docker build -t ft_services_phpmyadmin srcs/phpmyadmin/.
docker build -t ft_services_wordpress srcs/wordpress/.
docker build -t ft_services_nginx srcs/nginx/. 
docker build -t ft_services_influxdb srcs/influxdb/.
docker build -t ft_services_grafana srcs/grafana/.

# APPLYING CONFIG FILES
kubectl apply -f srcs/metallb.yaml --kubeconfig="~/.kube/config"
kubectl apply -f srcs/mysql/mysql.yaml --kubeconfig="~/.kube/config"
kubectl apply -f srcs/ftps/ftps.yaml --kubeconfig="~/.kube/config"
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml --kubeconfig="~/.kube/config"
kubectl apply -f srcs/wordpress/wordpress.yaml --kubeconfig="~/.kube/config"
kubectl apply -f srcs/nginx/nginx.yaml --kubeconfig="~/.kube/config"
kubectl apply -f srcs/influxdb/influxdb.yaml --kubeconfig="~/.kube/config"
kubectl apply -f srcs/grafana/grafana.yaml --kubeconfig="~/.kube/config"

# TO MAKE SURE ALL SERVICES HAVE STARTED
sleep 15

# IMPORTING WORDPRESS CONFIG
kubectl exec -i `kubectl get pods | grep -o "\S*mysql\S*"` -- mysql wordpress -u root < srcs/mysql/wordpress.sql --kubeconfig="~/.kube/config"

# OPENING DASHBOARD IN WEB BROWSER
minikube dashboard
