#!/bin/bash

cd opencv

num_processors=$(nproc)
echo "전체 프로세서 코어 개수: $num_processors"

if [ ! -d "build" ]; then
    mkdir "build" && cd "build"
else
    cd "build"
fi

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_OPENGL=ON -D WITH_V4L=ON -D WITH_FFMPEG=ON -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.5.4/modules ..

min_jobs=1
num_jobs=$((num_processors > min_jobs ? num_processors - 2 : min_jobs))

echo "빌드에 사용하는 프로세서 개수: $num_jobs"

make -j"$num_jobs"

