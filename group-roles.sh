#!/bin/bash

# give admin access to keycloak 'admin' group
kubectl --user=minikube apply -f cluster-roles/cluster-role-binding-admin-group.yml


# give pods read only access to keycloak 'monitor' group
kubectl --user=minikube apply -f cluster-roles/cluster-role-list-pods.yaml
kubectl --user=minikube apply -f cluster-roles/cluster-role-binding-monitor-group.yaml


