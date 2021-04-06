#!/bin/sh

echo "Starting minikube ->"
minikube --vm-driver=virtual-box
minikube start

echo "Enable ingress and dashboard"
minikube addons enable ingress
minikube addons enable dashboard

echo "Dashboard ->"
minikube dashboard &

echo "Eval -> "
eval $(minikube docker-env)
IP=$(minikube ip)
printf "Minikube IP: ${IP}"

echo "Building images ->"
docker build -t ftps ./srcs/ftps

echo "Creating pods and services ->"
kubectl create -f ./srcs/
