#!/bin/bash

sudo apt update
sudo apt install -y mysql-server
sudo apt-get install -y expect

set mysql_root_password "your_mysql_root_password"

spawn sudo -S mysql_secure_installation

expect {
    "Password:" {
        send "$mysql_root_password\r"
        exp_continue
    }
    "Press y|Y for Yes, any other key for No:" {
        send "n\r"
        exp_continue
    }
    "Press y|Y for Yes, N|n for No:" {
         send "n\r"
	 exp_continue
    }
    "Remove anonymous users?" {
         send "y\r"
	 exp_continue
    }
    "Disallow root login remotely?" {
         send "y\r"
	 exp_continue
    }
    "Remove test database and access to it?" {
         send "y\r"
	 exp_continue
    }
    "Reload privilege tables now?" {
         send "y\r"
	 exp_continue
    }
}

expect eof

sudo systemctl start mysql
sudo systemctl enable mysql

echo "MySQL이 성공적으로 설치되었습니다."
