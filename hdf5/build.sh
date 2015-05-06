#!/bin/bash

if [ `uname` == Darwin ]; then
	export CC=clang
	export CXX=clang++
	
	./configure --prefix=$PREFIX --disable-static \
	    --with-zlib=$PREFIX \
	    --enable-cxx \
	    --enable-shared \
	    -with-pic
else
	./configure --prefix=$PREFIX --disable-static \
		--enable-linux-lfs --with-zlib=$PREFIX \
		--enable-cxx --enable-shared
fi

make
make install

rm -rf $PREFIX/share/hdf5_examples
