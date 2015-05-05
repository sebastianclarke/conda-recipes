#!/bin/bash

if [ `uname` == Darwin ]; then
	export CC=clang
	export CXX=clang++
	
	#export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk
	
	cd trunk
	cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D CMAKE_SKIP_RPATH=ON \
	-D HDF5_INCLUDE_DIR=$PREFIX/include \
	-D HDF5_LIB_PATH=$PREFIX/lib \
	-D GDAL_INCLUDE_DIR=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	-D CMAKE_OSX_SYSROOT="/" \
	-D CMAKE_OSX_DEPLOYMENT_TARGET="" \
	.
else
	cd trunk
	cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D CMAKE_SKIP_RPATH=ON \
	-D HDF5_INCLUDE_DIR=$PREFIX/include \
	-D HDF5_LIB_PATH=$PREFIX/lib \
	-D GDAL_INCLUDE_DIR=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	.
fi


make
make install
