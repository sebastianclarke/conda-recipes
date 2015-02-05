cd trunk
cmake -D CMAKE_INSTALL_PREFIX=%PREFIX% ^
-D CMAKE_VERBOSE_MAKEFILE=ON ^
-D HDF5_INCLUDE_DIR=%LIBRARY_INC% ^
-D HDF5_LIB_PATH=%LIBRARY_LIB% ^
-D GDAL_INCLUDE_DIR=%LIBRARY_INC% ^
-D GDAL_LIB_PATH=%LIBRARY_LIB% ^
-G "NMake Makefiles" .
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1
