#!/bin/bash

sudo make install

if ! grep -q '/usr/local/lib' /etc/ld.so.conf.d/*; then
    echo '/usr/local/lib' | sudo tee /etc/ld.so.conf.d/opencv.conf > /dev/null

    sudo ldconfig
fi

