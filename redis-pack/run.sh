#!/bin/bash

CONTAINER_ID=$(docker ps -f name=rental_games_redis -q)
if [ ! -z $CONTAINER_ID ]; then
    docker kill $CONTAINER_ID
fi

docker run -d --rm -p 6379:6379 \
	-v $PWD/data:/data \
    --name rental_games_redis \
    redis:5.0.5
