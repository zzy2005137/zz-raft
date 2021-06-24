
#！/bin/bash
#修改ubuntu软件源
#桌面打开software&update 修改download from, 选择aliyun


echo "#########################"
echo "#   installation start  #"
echo "#########################"

sudo apt update 
# curl -sSL https://get.daocloud.io/docker | sh 
sudo apt install docker-compose 
sudo apt install git 
sudo apt install wget 




echo "########################"
echo "# installing docker    #"
echo "########################"


sudo apt install docker.io 
#查看docker服务状态
# sudo systemctl status docker
#添加到用户组
echo "adding current user into docker user group"
echo "input your user name"
read USER
# sudo usermod -aG docker ${USER}
sudo gpasswd -a $USER docker


#修改镜像源
echo "change docker image download source"
sudo echo "{\"registry-mirrors\":[\"http://hub-mirror.c.163.com\"]}" >> daemon.json
sudo cp daemon.json /etc/docker/
#重启docker服务
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "#########################"
echo "#        安装go         #"
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

#修改go env 
go env -w GOPROXY="https://goproxy.io,direct" 
go env | grep GOPROXY 

echo "=========检查版本============"

docker-compose --version 
git version 
echo "reopen the terminal to check go version "
echo "try docker version "
# go version 


echo "#########################"
echo "#   installation fished  #"
echo "#########################"


newgrp docker  #login using docker group