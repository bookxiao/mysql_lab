#!/bin/bash

NAME=$(cat servername)
TAG=8.0
ROOT_PASSWORD=123

if [ "$(docker ps -q -f name=${NAME})" ]; then
    echo "container is running, stop it first"
    docker stop ${NAME}
fi
if [ "$(docker ps -aq -f status=exited -f name=${NAME})" ]; then
    docker rm ${NAME}
fi

docker run --name ${NAME} -e MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD} \
    --network mysql-net -p 3306:3306 \
    -v /home/shuxiao/lab/db/mysql/docker/conf:/etc/mysql \
    -v /home/shuxiao/lab/db/mysql/docker/data:/var/lib/mysql \
    -d mysql:${TAG}
