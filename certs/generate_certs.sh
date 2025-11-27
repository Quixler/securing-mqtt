#!/bin/bash
# generate_certs.sh - Génère CA et certificats serveur pour Mosquitto TLS

set -e
CERTS_DIR=~/mqtt-secure/certs
mkdir -p $CERTS_DIR

# CA
openssl genrsa -out $CERTS_DIR/ca.key 4096
openssl req -x509 -new -nodes -key $CERTS_DIR/ca.key -sha256 -days 3650 \
  -out $CERTS_DIR/ca.crt -subj "/C=MA/ST=Souss-Massa/L=Agadir/O=OussamaIoT/OU=Security/CN=Oussama-CA"

# Server key + CSR
openssl genrsa -out $CERTS_DIR/server.key 4096
openssl req -new -key $CERTS_DIR/server.key -out $CERTS_DIR/server.csr \
  -subj "/C=MA/ST=Souss-Massa/L=Agadir/O=OussamaIoT/OU=Broker/CN=localhost"

# Sign server cert
openssl x509 -req -in $CERTS_DIR/server.csr -CA $CERTS_DIR/ca.crt -CAkey $CERTS_DIR/ca.key \
  -CAcreateserial -out $CERTS_DIR/server.crt -days 825 -sha256

chmod 600 $CERTS_DIR/*.key
echo "Certificates generated in $CERTS_DIR"
