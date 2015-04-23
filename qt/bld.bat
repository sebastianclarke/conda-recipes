
configure.exe -release -opensource ^
        -no-qt3support -nomake examples -nomake demos ^
        -webkit -qt-libpng -qt-zlib  ^
        -prefix %PREFIX%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1

move %PREFIX%\bin\*.* %PREFIX%
if errorlevel 1 exit 1

REM already in bin also - don't need the duplication
del %PREFIX%\lib\*.dll 
        