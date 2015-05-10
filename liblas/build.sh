#!/bin/bash

if [ `uname` == Darwin ]; then
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D WITH_LASZIP=TRUE \
    -D WITH_GDAL=TRUE \
    -D WITH_GEOTIFF=TRUE \
    -D LASZIP_LIBRARY=$PREFIX/lib/liblaszip.dylib \
    -D LASZIP_INCLUDE_DIR=$PREFIX/include \
    -D BOOST_ROOT=$PREFIX \
    -D BOOST_INCLUDEDIR=$PREFIX/include \
    -D GEOTIFF_LIBRARY=$PREFIX/lib/libgdal.dylib \
	-D GEOTIFF_INCLUDE_DIR=$PREFIX/include/gdal/frmts/gtiff/libgeotiff/ \
	-D TIFF_LIBRARY=$PREFIX/lib/libgdal.dylib \
	-D TIFF_INCLUDE_DIR=$PREFIX/include/gdal/frmts/gtiff/libtiff/ \
    .
else
    export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D WITH_LASZIP=TRUE \
    -D BOOST_ROOT=$PREFIX \
    -D BOOST_INCLUDEDIR=$PREFIX/include \
    -D LASZIP_LIBRARY=$PREFIX/lib/liblaszip.so \
    -D LASZIP_INCLUDE_DIR=$PREFIX/include \
    .
fi
make
make install
