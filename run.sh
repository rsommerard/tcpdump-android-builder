#!/bin/bash

rm -rf build
mkdir build

docker run -v $PWD/build:/home/builder/build tcpdumpab
