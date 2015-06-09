#!/bin/bash

export DYLD_LIBRARY_PATH="$PREFIX/lib:$DYLD_LIBRARY_PATH"
export LDFLAG="-L$PREFIX/lib -lbz2"
export LIBS="-lbz2"

export CC=clang
export CXX=clang++

export CFLAGS="-L$PREFIX/lib -lbz2"

./configure --enable-R-shlib \
--enable-R-framework=no \
--with-readline=yes \
--with-tcl-config=$PREFIX/lib/tclConfig.sh \
--with-tk-config=$PREFIX/lib/tkConfig.sh \
--prefix=$PREFIX \
--with-x=no \
--with-aqua=no

make
make install
