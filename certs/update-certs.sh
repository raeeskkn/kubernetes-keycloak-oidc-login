# cert for kubelogin to work
sudo mkdir -p /usr/share/ca-certificates/extra

sudo cp certs/rootCA.crt /usr/share/ca-certificates/extra/rootCA.crt
sudo dpkg-reconfigure ca-certificates
sudo update-ca-certificates

# cert for minikube to interact with nginx
sudo cp certs/rootCA.pem ~/.minikube/certs/



kubectl oidc-login setup \
  --oidc-issuer-url=https://10.0.2.2:8443/auth/realms/master \
  --oidc-client-id=kubernetes-client