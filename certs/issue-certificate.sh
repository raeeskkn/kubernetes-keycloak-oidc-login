#!/bin/bash

openssl genrsa -out certs/rootCA.key 4096
openssl req -x509 -new -nodes -key certs/rootCA.key -sha256 -days 1024 -out certs/rootCA.crt

openssl genrsa -out certs/cert.key 2048
openssl req -config certs/ssl.conf -new -key certs/cert.key -out certs/cert.csr
openssl x509 -req -in certs/cert.csr -CA certs/rootCA.crt -CAkey certs/rootCA.key -CAcreateserial -out certs/cert.crt -days 500 -sha256 -extensions v3_req -extfile certs/ssl.conf

openssl x509 -in certs/rootCA.crt -out certs/rootCA.pem

