#!/bin/bash
if [ -z ${FORWARD_HOST+x} ] || [ -z ${FORWARD_PORT+x} ]; then
   echo "FORWARD_HOST and FORWARD_PORT are required environment variables"
   exit 1
fi
ngrok authtoken 2omwLcanq4gGwG7Fx0KmoZgJk8g_7t7PfMvK2nQGXd19A2T4C &
ngrok http "${FORWARD_HOST}:${FORWARD_PORT}" &
exec socat TCP-LISTEN:8080,fork,reuseaddr TCP:localhost:4040 
