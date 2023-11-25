#!/bin/bash

TARGET_IMAGE="ros/melodic:dev"
CONTAINER_NAME=$(docker ps -a --format "{{.Names}} {{.Image}}" | awk -v target_image="$TARGET_IMAGE" '$2 == target_image {print $1}')

if [ -n "$CONTAINER_NAME" ]; then
    echo "이미지 $TARGET_IMAGE를 사용하는 컨테이너를 찾아 해당 컨테이너에 접속합니다."
    docker exec -it $CONTAINER_NAME /bin/bash
else
    echo "이미지 $TARGET_IMAGE를 사용하는 컨테이너가 없어 새로운 컨테이너를 시작하고 접속합니다."
    CONTAINER_NAME="new_container_name"
    docker run -it --name $CONTAINER_NAME $TARGET_IMAGE /bin/bash
fi

