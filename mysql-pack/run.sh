#!/bin/bash

REPOSRC="https://github.com/itslaves/mysql-config.git"
LOCALREPO="$PWD/repo"

git clone "$REPOSRC" "$LOCALREPO" 2> /dev/null || (cd "$LOCALREPO" && git pull)

CONTAINER_ID=$(docker ps -f name=rental_games_mysql -q)
if [ ! -z $CONTAINER_ID ]; then
    docker kill $CONTAINER_ID
fi

docker run -d --rm -p 3306:3306 \
    --name rental_games_mysql \
    -e MYSQL_DATABASE=rental_games \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
    -v $LOCALREPO/tables:/docker-entrypoint-initdb.d:ro \
    mysql:8.0


