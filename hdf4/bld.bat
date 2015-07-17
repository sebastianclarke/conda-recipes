mkdir build
cd build

REM Configure step
set CMAKE_CUSTOM=
set CMAKE_GENERATOR=NMake Makefiles
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE=Release ^
-DHDF4_BUILD_HL_LIB=ON ^
-DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
-DZLIB_LIBRARY=%LIBRARY_LIB%\zlibstatic.lib ^
-DZLIB_INCLUDE_DIR=%LIBRARY_INC% ^
-DJPEG_LIBRARY=%LIBRARY_LIB%\jpeg.lib ^
-DJPEG_INCLUDE_DIR=%LIBRARY_INC% ^
-DCMAKE_PREFIX_PATH=%PREFIX% ^
-DHDF4_BUILD_FORTRAN=NO ^
-DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% %CMAKE_CUSTOM% %SRC_DIR%

if errorlevel 1 exit 1

REM Build step
nmake
if errorlevel 1 exit 1

REM Install step
nmake install
if errorlevel 1 exit 1
