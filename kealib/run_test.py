import os, subprocess, sys

# Get conda prefix
conda_prefix=os.getenv('PREFIX')
# Set GDAL driver path (so KEA will be found)
if sys.platform != 'win32':
    # should be unnecessary on windows - file already in correct place to be picked up
    os.putenv('GDAL_DRIVER_PATH',os.path.join(conda_prefix,'gdalplugins'))

try:
    from osgeo import gdal
except ImportError:
    print("Could not import GDAL Python bindings")
    print("Running 'gdal_translate' - check if KEA is available")
    subprocess.call(['gdal_translate','--formats'])
else:
    driver = gdal.GetDriverByName("KEA")
    if driver is None:
        print("ERROR: Could not import KEA in GDAL")
    else:
        print("KEA driver recognised from Python")
