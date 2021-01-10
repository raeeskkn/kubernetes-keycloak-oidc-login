#!/bin/bash

# Removed all traces of the "minikube" cluster
minikube delete

# Remove docker services
sudo docker-compose down

# remove cert for kubelogin
sudo rm -r /usr/share/ca-certificates/extra
sudo dpkg-reconfigure ca-certificates
sudo update-ca-certificates

# remove cert for minikube
sudo rm ~/.minikube/certs/rootCA.pem

# remove certs
sudo rm certs/*.{crt,csr,key,pem,srl}