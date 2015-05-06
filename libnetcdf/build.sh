#!/bin/bash

if [ `uname` == Darwin ]; then
	export CC=clang
	export CXX=clang++
	export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
fi

CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib" \
./configure --prefix=$PREFIX \
--enable-netcdf-4 \
--disable-examples \
--with-pic

make 
make install