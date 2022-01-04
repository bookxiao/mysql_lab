#!/bin/sh

TAG=8.0
NAME=mysql-forfun
PORT=3306
USER=mysql
PASSWD=mysql

docker run -it --network mysql-net --rm mysql:8.0 mysql -h${NAME} -P${PORT} -u${USER} -p${PASSWD}
