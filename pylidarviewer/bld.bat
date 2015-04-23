
cmake -D CMAKE_INSTALL_PREFIX=%PREFIX% -D QT_BINARY_DIR=%PREFIX% ^
-G "NMake Makefiles" .
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1

move %PREFIX%\lib\pylv.dll %PREFIX%
