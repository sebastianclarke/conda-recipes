#!/bin/bash

if [ `uname` == Darwin ]; then
    export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
else
    export LD_LIBRARY_PATH=$PREFIX/lib
fi

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D Boost_INCLUDE_DIR=$PREFIX/include \
-D GDAL_CONFIG=$PREFIX/bin/gdal-config \
.

make
make install
