#!/bin/bash
#修改地址，检查版本


git version 
docker-compose --version
docker --version 


#修改go env 
go version 
go env -w GOPROXY="https://goproxy.io,direct" 
go env | grep GOPROXY 

echo "#######   check docker source    #########"
cat /etc/docker/daemon.json 


echo "#######################"
echo "#      done           #"
echo "#######################"
