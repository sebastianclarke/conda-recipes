
set GDAL_HOME=%LIBRARY_PREFIX%

%PYTHON% setup.py install
if errorlevel 1 exit 1
