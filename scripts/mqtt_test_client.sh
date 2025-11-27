#!/usr/bin/env python3
# mqtt_test_client.py - Simple MQTT client for testing

import paho.mqtt.client as mqtt

BROKER = "localhost"
PORT = 8883
TOPIC = "demo/device1/write"
USERNAME = "user_demo"
PASSWORD = "123456"
CAFILE = "/home/oussama/mqtt-secure/certs/ca.crt"

def on_connect(client, userdata, flags, rc):
    print("Connected with result code", rc)
    client.subscribe("demo/device1/read")

def on_message(client, userdata, msg):
    print(f"Received: {msg.topic} -> {msg.payload.decode()}")

client = mqtt.Client()
client.username_pw_set(USERNAME, PASSWORD)
client.tls_set(ca_certs=CAFILE)
client.on_connect = on_connect
client.on_message = on_message

client.connect(BROKER, PORT, 60)
client.publish(TOPIC, "Hello from Python client")

client.loop_forever()
