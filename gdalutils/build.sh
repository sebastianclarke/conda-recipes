#!/bin/bash

cd utils

rm -f CMakeCache.txt

if [ `uname` == Darwin ]; then
    #export DYLD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D GDAL_INCLUDE_DIR=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	-D GEOS_INCLUDE_DIR=$PREFIX/include \
	-D GEOS_LIB_PATH=$PREFIX/lib \
	-D CMAKE_OSX_SYSROOT="/" \
	-D CMAKE_OSX_DEPLOYMENT_TARGET="" \
	.
else
    export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D GDAL_INCLUDE_DIR=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	-D GEOS_INCLUDE_DIR=$PREFIX/include \
	-D GEOS_LIB_PATH=$PREFIX/lib \
	.
fi

make 
make install

cd ../libimgf90

rm -f CMakeCache.txt

if [ `uname` == Darwin ]; then
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D GDAL_INCLUDE_PATH=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	-D CMAKE_OSX_SYSROOT="/" \
	-D CMAKE_OSX_DEPLOYMENT_TARGET="" \
	.
else
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D GDAL_INCLUDE_PATH=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	.
fi

make
make install

cd ../pyutils

python setup.py install --prefix=$PREFIX



