#!/bin/bash

sudo apt update
sudo apt install -y rocm-dkms rocm-libs miopen-hip docker.io

if groups $(whoami) | grep &>/dev/null '\brocm\b'; then
    echo "사용자는 이미 rocm 그룹에 속해 있습니다."
else
    sudo usermod -aG rocm $(whoami)
    
    echo "사용자를 rocm 그룹에 추가했습니다. 시스템을 재부팅하십시오."
    exit 0
fi

docker build -t rocm_tensorflow_amd - <<EOF
FROM rocm/tensorflow:rocm4.2-tf2.6-dev

RUN apt-get update && \
    apt-get install -y python3-opencv
EOF

docker run --gpus all -it --rm \
    --name tf_amd_container \
    -v $(pwd):/workspace \
    -w /workspace \
    -p 8888:8888 \
    rocm_tensorflow_amd \
    bash -c "pip install keras && jupyter notebook --ip=0.0.0.0 --no-browser --allow-root"

