#!/bin/bash
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
.

make

rm $SRC_DIR/Modules/CPack.OSXScriptLauncher.in
make install
