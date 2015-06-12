#!/bin/bash

# Library doesn't support Python3.
# run 2to3 first.
if [ $PY3K == "1" ]; then
    2to3 -w .
    python setup.py install --prefix=$PREFIX
else
    python setup.py install --prefix=$PREFIX
fi
