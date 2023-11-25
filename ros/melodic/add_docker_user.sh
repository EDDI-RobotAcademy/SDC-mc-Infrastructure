#!/bin/bash

USERNAME="eddi"
USER_HOME="/home/$USERNAME"

if id "$USERNAME" &>/dev/null; then
    echo "사용자 $USERNAME 가 이미 존재합니다."
else
    echo "사용자 $USERNAME 생성"
    sudo useradd -s /bin/bash -d "$USER_HOME" -g root -m -G sudo "$USERNAME"
    
    echo "사용자 $USERNAME의 비밀번호 설정"
    sudo passwd "$USERNAME"

	sudo usermod -aG docker $USER
	newgrp docker
fi
