#!/bin/bash
if [ -z ${FORWARD_HOST+x} ] || [ -z ${FORWARD_PORT+x} ]; then
   echo "FORWARD_HOST and FORWARD_PORT are required environment variables"
   exit 1
fi
ngrok authtoken 2p1gL97uzdJVtWqPl82A6uzcQZ3_7znjH9LectWrmbyidr6Qu &
ngrok http "${FORWARD_HOST}:${FORWARD_PORT}" &
exec socat TCP-LISTEN:8080,fork,reuseaddr TCP:localhost:4040 
