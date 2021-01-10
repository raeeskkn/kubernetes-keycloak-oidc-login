#!/bin/bash

# create and issue certificates
./certs/issue-certificate.sh

# copy and update system and minikube certs
./certs/update-certs.sh

# start docker services: keycloak, nginx, mysql
sudo docker-compose up --detach
sleep 30

# start minikube with api server params
./minikube.sh

# configure .kube file and use new context
./kube-config.sh

# assign roles to the keycloak groups
./group-roles.sh