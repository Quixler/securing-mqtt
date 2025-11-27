#!/bin/bash
# verify_security.sh - Vérifie la sécurité du broker

echo "Test anonymous connection (should fail)..."
mosquitto_pub -h localhost -p 8883 -t demo/test -m "fail" --cafile ~/mqtt-secure/certs/ca.crt || echo "Rejected as expected"

echo "Test authenticated connection..."
mosquitto_pub -h localhost -p 8883 -u user_demo -P 123456 \
  -t demo/device1/write -m "Secure message" --cafile ~/mqtt-secure/certs/ca.crt
