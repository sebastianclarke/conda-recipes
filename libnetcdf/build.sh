#!/bin/bash

if [ `uname` == Darwin ]; then
    export CC=clang
    export CXX=clang++
fi

CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib" \
./configure --prefix=$PREFIX \
--enable-netcdf-4 \
--disable-examples \
--with-pic

make 
make install
