cmake -DBUILD_THIRDPARTY=ON -DCMAKE_INSTALL_PREFIX=$PREFIX .
make
make install
make clean
