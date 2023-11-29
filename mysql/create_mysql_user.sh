#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "사용법: $0 <사용자이름> <비밀번호> <데이터베이스>"
    exit 1
fi

MYSQL_USER="$1"
MYSQL_PASSWORD="$2"
MYSQL_DATABASE="$3"

sudo mysql -u root -p"${MYSQL_PASSWORD}" <<EOF
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "MySQL 계정 생성 및 권한 갱신이 완료되었습니다."
