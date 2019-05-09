#!/bin/bash

CONTAINER_ID=$(docker ps -f name=rental_games_mysql -q)
if [ ! -z $CONTAINER_ID ]; then
    docker kill $CONTAINER_ID
fi

docker run -d --rm -p 3306:3306 \
    --name rental_games_mysql \
    -e MYSQL_DATABASE=rental_games \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
    -v $PWD/tables:/docker-entrypoint-initdb.d:ro \
    mysql:8.0


