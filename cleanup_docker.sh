#!/usr/bin/env bash


docker rm $(docker ps -a -q)

docker rmi -f $(docker images -a | grep -v IMAGE | awk "{print \$3}")
#docker rmi -f $(docker images -a | grep "^<none>" | awk "{print \$3}")
docker pull registry.cn-shenzhen.aliyuncs.com/xiaoxijin/apline_php7.1_extend
docker tag registry.cn-shenzhen.aliyuncs.com/xiaoxijin/apline_php7.1_extend fphp