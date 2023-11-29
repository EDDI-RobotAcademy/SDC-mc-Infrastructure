#!/bin/bash

sudo apt update
sudo apt install -y mysql-server
sudo apt-get install -y expect

mysql_root_password="your_password"

expect <<EOF
spawn sudo -S mysql_secure_installation
expect "Password:"
send "$mysql_root_password\r"
expect "Press y|Y for Yes, any other key for No:"
send "n\r"
expect "Press y|Y for Yes, N|n for No:"
send "n\r"
expect "Remove anonymous users?"
send "y\r"
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
