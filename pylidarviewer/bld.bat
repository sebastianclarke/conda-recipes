
cmake -D CMAKE_INSTALL_PREFIX=%PREFIX% ^
-G "NMake Makefiles" .
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1
