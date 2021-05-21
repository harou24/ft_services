# ft_services

ft_services is a school project that introduces with Kubernetes, network virtualization and clustering. It consists of setting up an infrastructure of different services.

<p align="center">
<img src="https://www.marineterrein.nl/wp-content/uploads/2019/09/highres_482360765-830x466.jpeg"  width=35% height=35%>
</p>


# Technical requirements

- Set up a multi-service cluster using Kubernetes.
- Each service will have to run in a dedicated container.
- Containers have to be build using Alpine Linux.
- Set up  Kubernetes web dashboard.
- Set up a Load Balancer which manages the external access of your services. It will be the only entry point to your cluster.
- All the containers must restart in case of a crash or stop of one of its component
parts.

:warning: It is forbidden to take already build images or use services like DockerHub. :warning:

# Containers
- WordPress website listening on port 5050.
- MySql database.
- phpMyAdmin listening on port 5000 and linked with the MySQL database.
- Nginx server listening on ports 80 and 443.
- FTPS server listening on port 21.
- A Grafana platform, listening on port 3000, linked with an InfluxDB database.

# Tools
  - Minikube : minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.
  - Docker : software platform for building applications based on containers.
  - VirtualBox : general-purpose virtualization tool.
  
# How to run

```bash
bash setup.sh



