#!/bin/bash
# apply_hardening.sh - Configure Mosquitto avec auth + ACL + TLS

CONFIG_DIR=~/mqtt-secure/config
ACL_DIR=~/mqtt-secure/acl

cat > $CONFIG_DIR/tls.conf <<EOF
listener 8883
allow_anonymous false
password_file $ACL_DIR/passwords
acl_file $ACL_DIR/aclfile

cafile ~/mqtt-secure/certs/ca.crt
certfile ~/mqtt-secure/certs/server.crt
keyfile ~/mqtt-secure/certs/server.key

tls_version tlsv1.2
log_type all
connection_messages true
EOF

echo "Starting hardened Mosquitto broker on port 8883..."
mosquitto -c $CONFIG_DIR/tls.conf -v
