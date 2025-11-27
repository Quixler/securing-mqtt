#!/bin/bash
# setup_vulnerable.sh - Démarre un broker Mosquitto vulnérable

CONFIG_DIR=~/mqtt-secure/config
mkdir -p $CONFIG_DIR

cat > $CONFIG_DIR/baseline.conf <<EOF
listener 1883
allow_anonymous true
log_type all
connection_messages true
EOF

echo "Starting vulnerable Mosquitto broker on port 1883..."
mosquitto -c $CONFIG_DIR/baseline.conf -v
