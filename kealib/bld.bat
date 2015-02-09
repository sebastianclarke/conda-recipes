cd trunk
cmake -D CMAKE_INSTALL_PREFIX=%PREFIX% ^
-D CMAKE_VERBOSE_MAKEFILE=ON ^
-D HDF5_INCLUDE_DIR=%PREFIX%\include ^
-D HDF5_LIB_PATH=%PREFIX%\lib ^
-D GDAL_INCLUDE_DIR=%PREFIX%\include ^
-D GDAL_LIB_PATH=%PREFIX%\lib ^
-G "NMake Makefiles" .
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1

REM move the DLL into the root - for some reason in lib rather than bin
move %PREFIX%\lib\libkea.dll %PREFIX%
if errorlevel 1 exit 1

REM copy driver dir into just below the DLL
move %PREFIX%\lib\gdalplugins %PREFIX% 
if errorlevel 1 exit 1
