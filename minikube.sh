#!/bin/bash

sudo ifconfig lo:1 10.0.2.2 up

minikube start \
  --extra-config=apiserver.authorization-mode=Node,RBAC \
  --extra-config=apiserver.oidc-issuer-url=https://10.0.2.2:8443/auth/realms/master  \
  --extra-config=apiserver.oidc-username-claim=preferred_username \
  --extra-config=apiserver.oidc-client-id=kubernetes-client \
  --extra-config=apiserver.oidc-username-prefix=- \
  --extra-config=apiserver.oidc-groups-prefix=kubernetes: \
  --extra-config=apiserver.oidc-groups-claim=groups
