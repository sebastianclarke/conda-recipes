#!/bin/bash

# Checkout the default branch of SPDLib
hg update default

if [ `uname` == Darwin ]; then
    export DYLD_LIBRARY_PATH=$PREFIX/lib
    PYTHONLIB=$PREFIX/lib/libpython3.4m.dylib
else
    export LD_LIBRARY_PATH=$PREFIX/lib
    PYTHONLIB=$PREFIX/lib/libpython3.4m.so
fi

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D HDF5_INCLUDE_DIR=$PREFIX/include \
-D HDF5_LIB_PATH=$PREFIX/lib \
-D LIBLAS_INCLUDE_DIR=$PREFIX/include \
-D LIBLAS_LIB_PATH=$PREFIX/lib \
-D GSL_INCLUDE_DIR=$PREFIX/include \
-D GSL_LIB_PATH=$PREFIX/lib \
-D CGAL_INCLUDE_DIR=$PREFIX/include \
-D CGAL_LIB_PATH=$PREFIX/lib \
-D BOOST_INCLUDE_DIR=$PREFIX/include \
-D BOOST_LIB_PATH=$PREFIX/lib \
-D GDAL_INCLUDE_DIR=$PREFIX/include \
-D GDAL_LIB_PATH=$PREFIX/lib \
-D XERCESC_INCLUDE_DIR=$PREFIX/include \
-D XERCESC_LIB_PATH=$PREFIX/lib \
-D GMP_INCLUDE_DIR=$PREFIX/include \
-D GMP_LIB_PATH=$PREFIX/lib \
-D MPFR_INCLUDE_DIR=$PREFIX/include \
-D MPFR_LIB_PATH=$PREFIX/lib \
-D CMAKE_VERBOSE_MAKEFILE=ON \
.

make
make install

cd ngpython

python setup.py build \
--gdalinclude=$PREFIX/include \
--boostinclude=$PREFIX/include \
--gslinclude=$PREFIX/include \
--cgalinclude=$PREFIX/include \
--lasinclude=$PREFIX/include \
--hdf5include=$PREFIX/include
python setup.py install --prefix=$PREFIX

cd ../python

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX/lib/python3.4 \
-D CMAKE_VERBOSE_MAKEFILE=ON \
-D SPDLIB_IO_INCLUDE_DIR=$PREFIX/include \
-D SPDLIB_IO_LIB_PATH=$PREFIX/lib \
-D GDAL_INCLUDE_DIR=$PREFIX/lib \
-D HDF5_INCLUDE_DIR=$PREFIX/include \
-D HDF5_LIB_PATH=$PREFIX/lib \
-D CMAKE_VERBOSE_MAKEFILE=ON \
-D BOOST_INCLUDE_DIR=$PREFIX/include \
-D BOOST_LIB_PATH=$PREFIX/lib \
-D PYTHON_INCLUDE_DIR=$PREFIX/include/python3.4m \
-D PYTHON_LIBRARY=$PYTHONLIB \
.

make
make install
