#!/bin/bash

opencv_dir="opencv"
opencv_version="4.5.4"

if [ ! -d "$opencv_dir" ]; then
    mkdir "$opencv_dir" && cd "$opencv_dir"
else
    cd "$opencv_dir"

    if [ -d "opencv-$opencv_version" ] && [ -d "opencv_contrib-$opencv_version" ]; then
        echo "OpenCV directories already exist. Nothing to do."
    else
        wget -O opencv.zip "https://github.com/opencv/opencv/archive/$opencv_version.zip"
        wget -O opencv_contrib.zip "https://github.com/opencv/opencv_contrib/archive/$opencv_version.zip"
        unzip "opencv.zip"
        unzip "opencv_contrib.zip"
    fi
fi

