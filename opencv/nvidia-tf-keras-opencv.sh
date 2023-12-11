#!/bin/bash

tensorflow_image="tensorflow/tensorflow:latest-gpu"
opencv_image="opencv:latest"

container_name="tf_keras_opencv_container"

docker run --gpus all -it --rm \
    --name $container_name \
    -v $(pwd):/workspace \
    -w /workspace \
    -p 8888:8888 \
    $tensorflow_image \
    bash -c "pip install keras opencv-python && jupyter notebook --ip=0.0.0.0 --no-browser --allow-root"

