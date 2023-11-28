#!/bin/bash

sudo apt update
sudo apt install -y mysql-server

sudo mysql_secure_installation

sudo systemctl start mysql
sudo systemctl enable mysql

echo "MySQL이 성공적으로 설치되었습니다."
