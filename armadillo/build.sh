#!/bin/bash

if [ `uname` == Darwin ]; then
	export CC=clang
	export CXX=clang++
fi

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D DETECT_HDF5=ON \
-D CMAKE_SKIP_RPATH=YES \
-D CMAKE_OSX_DEPLOYMENT_TARGET=10.10 \
.

make
make install
