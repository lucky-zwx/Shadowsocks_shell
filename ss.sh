#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin:~/bin
export PATH

config(){
	pip install shadowsocks
	read -t 30 -p "Please input your IP:" HOST_IP
	read -t 30 -p "Please input your key:" PASS_WROD
	read -t 30 -p "Please input your Port:" PORT

	echo "{
	\"server\":\"$HOST_IP\",
	\"server_port\":$PORT,
	\"password\":\"$PASS_WROD\",
	\"timeout\":300,
	\"method\":\"aes-256-cfb\"
	}" >> ssserver.json

	ssserver -c ~/ssserver.json -d start
}

if grep -q "ubuntu" /etc/os-release
then
        sudo apt update -y
		sudo apt install  -y python-setuptools && easy_install pip
		config
		elif    grep -q "centos" /etc/os-release
			then
			yum update -y
			yum install -y python-setuptools && easy_install pip
			config
fi
