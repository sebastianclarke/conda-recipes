#!/bin/bash

CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib" \
./configure --prefix=$PREFIX \
--enable-netcdf-4 \
--disable-examples \
--with-pic

make 
make install


