#!/bin/bash

# set up user: kubelogin setup
kubectl config set-credentials oidc \
  --exec-api-version=client.authentication.k8s.io/v1beta1 \
  --exec-command=kubectl \
  --exec-arg=oidc-login \
  --exec-arg=get-token \
  --exec-arg=--oidc-issuer-url=https://10.0.2.2:8443/auth/realms/master \
  --exec-arg=--oidc-client-id=kubernetes-client

# set up cluster
kubectl config set-cluster c1 --server https://192.168.99.100:8443 --certificate-authority /home/raees/.minikube/ca.crt

# set up context
kubectl config set-context c1-context --cluster c1 --user oidc

# use context
kubectl config use-context c1-context