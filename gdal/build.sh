#!/bin/bash

./configure --with-python --prefix=$PREFIX \
--with-geos=$PREFIX/bin/geos-config \
--with-static-proj4=$PREFIX \
--with-hdf5=$PREFIX \
--with-xerces=$PREFIX \
--without-pam \
--with-python \
--disable-rpath

make -j 4
make install

# Copy data files 
mkdir -p $PREFIX/share/gdal/
cp data/*csv $PREFIX/share/gdal/
cp data/*wkt $PREFIX/share/gdal/

