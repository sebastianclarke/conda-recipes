cmake -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release -G "NMake Makefiles" .

nmake
nmake install
