#!/bin/bash

CONTAINER_ID=$(docker ps -f name=rental_games_nginx -q)
if [ ! -z $CONTAINER_ID ]; then
    docker kill $CONTAINER_ID
fi

docker run -d --rm -p 8000:80 \
    --name rental_games_nginx \
    -v $PWD/webroot:/usr/share/nginx/html:ro \
    nginx:1.16
