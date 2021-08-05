#!/bin/bash 

echo "#########################"
echo "#   installation start  #"
echo "#########################"

sudo apt update
sudo apt install docker-compose
sudo apt install git
sudo apt install wget




echo "########################"
echo "# installing docker    #"
echo "########################"


sudo apt install docker.io
#查看docker服务状态
# sudo systemctl status docker


#修改镜像源
echo "change docker image download source"
sudo echo "{\"registry-mirrors\":[\"https://kfwkfulq.mirror.aliyuncs.com\",\"http://hub-mirror.c.163.com\"]}" >> daemon.json
sudo cp daemon.json /etc/docker/
#重启docker服务
sudo systemctl daemon-reload
sudo systemctl restart docker


echo "#########################"
echo "#    installing go      #"
echo "#########################"

wget https://golang.google.cn/dl/go1.16.5.linux-amd64.tar.gz
sudo tar -zxvf go1.16.5.linux-amd64.tar.gz -C /usr/local/

# vim /etc/profile
echo  >> ~/.bashrc
echo "#===============================" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=/home/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> ~/.bashrc
sleep 1
. ~/.bashrc


#添加到用户组
echo "adding current user into docker user group"
echo "input your user name :"
read USER
sudo groupadd docker
sudo usermod -aG docker $USER
echo "=======add $USER to docker group======"

# go version


echo "#############################"
echo "#   installation fished     #"
echo "#   reboot and run check.sh #"
echo "#############################"

