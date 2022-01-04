#!/bin/bash

NAME=$(cat servername)

docker exec -it ${NAME} mysql -uroot -p123
