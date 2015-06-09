#!/bin/bash

#rm fiona/*

python setup.py build_ext -I$PREFIX/include -L$PREFIX/lib -lgdal install
