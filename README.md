# Set up Kubernetes and Keycloak to manage users and groups and synchronize them

## Motivation
Kubernetes does not have its own user management. This project will show you how to use keycloak groups and user in order to access kubernetes api server. 

## Abstract
Nginx is kept in front of keycloak where keycloak is connected to the mysql database.
The user runs a kubectl command, a browser opens the keycloak webpage, the user enters credentials, and if the user authenticates and is authorized, the kubectl commands executes. The config file could later be provided to a new colleague during onboarding.

## Requirements
Ubuntu 18, Minikube, Openssl, Docker, Docker-compose, kubectl, krew, kubelogin

### 1. Start the project
Run
```sh
./start.sh
```

### 2. [optional] Remove oidc login cache
If another user would like to login, first we need to remove the oidc cache for existing user.
rm -r ~/.kube/cache/oidc-login

### 3. Clean the project
Remove all resources that were created in step 1.
Run
```sh
./clean.sh
```
