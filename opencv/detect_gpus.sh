#!/bin/bash

sudo apt-get install -y pciutils

pci_info=$(lspci)

nvidia_info=$(echo "$pci_info" | grep -i "NVIDIA Corporation")
amd_info=$(echo "$pci_info" | grep -i "Advanced Micro Devices")

if [[ $nvidia_info ]]; then
    echo "NVIDIA GPU가 감지되었습니다."
    echo "GPU 정보:"
    echo "$nvidia_info"

	bash nvidia-tf-keras-opencv.sh
elif [[ $amd_info ]]; then
    echo "AMD GPU가 감지되었습니다."
    echo "GPU 정보:"
    echo "$amd_info"

	bash amd-tf-keras-opencv.sh
else
    echo "NVIDIA 또는 AMD GPU가 감지되지 않았습니다."

	bash cpu-tf-keras-opencv.sh
fi

