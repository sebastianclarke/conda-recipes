#!/bin/bash

if [ `uname` == Darwin ]; then
    PGFLAG=""
    export LDFLAGS="-headerpad_max_install_names"
else
    PGFLAG="--with-pg=$PREFIX/bin/pg_config"
fi

./configure --with-python --prefix=$PREFIX \
--with-geos=$PREFIX/bin/geos-config \
--with-static-proj4=$PREFIX \
--with-netcdf=$PREFIX \
--with-hdf5=$PREFIX \
--with-hdf4=$PREFIX \
--with-xerces=$PREFIX \
--with-armadillo=$PREFIX \
--without-pam \
--with-python \
--disable-rpath \
--without-pam \
$PGFLAG

make -j 4
make install

# Copy data files 
mkdir -p $PREFIX/share/gdal/
cp data/*csv $PREFIX/share/gdal/
cp data/*wkt $PREFIX/share/gdal/

