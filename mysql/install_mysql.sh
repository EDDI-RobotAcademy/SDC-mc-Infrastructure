#!/bin/bash

sudo apt update
sudo apt install -y mysql-server
sudo apt-get install -y expect

read -s -p "Enter MySQL root password: " mysql_root_password
echo

expect <<EOF
set timeout 0.1
spawn sudo -S mysql_secure_installation
expect "Password:"
log_user 0  ;# Disable logging to stdout
send -- "$mysql_root_password\r"
expect "Disallow root login remotely?"
send "y\r"
expect "Remove test database and access to it?"
send "y\r"
expect "Reload privilege tables now?"
send "y\r"
expect eof
EOF

sudo systemctl start mysql
sudo systemctl enable mysql

echo "MySQL이 성공적으로 설치되었습니다."
