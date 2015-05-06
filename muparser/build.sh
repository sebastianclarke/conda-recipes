#!/bin/bash

if [ `uname` == Darwin ]; then
	export CC=clang
	export CXX=clang++
fi

bash configure --prefix=$PREFIX
make
make install

