
cmake -D CMAKE_INSTALL_PREFIX=%PREFIX% -D QT_BINARY_DIR=%PREFIX% ^
-D BUILD_PYTHON_BINDINGS=OFF -G "NMake Makefiles" .
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1

REM Need to do this separately from cmake - seems to be some conda strangeness
%PYTHON% setup.py build
if errorlevel 1 exit 1

%PYTHON% setup.py install
if errorlevel 1 exit 1

move %PREFIX%\lib\pylv.dll %PREFIX%
