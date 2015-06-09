#!/bin/bash

python setup.py configure --hdf5=$PREFIX
python setup.py build
python setup.py install --prefix=$PREFIX
