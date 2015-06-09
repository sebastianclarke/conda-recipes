import os
import subprocess
import sys

# Get conda prefix
conda_prefix=os.getenv('PREFIX')
# Set GDAL driver path (so KEA will be found)
if sys.platform != 'win32':
    # should be unnecessary on windows - file already in correct place to be picked up
    os.putenv('GDAL_DRIVER_PATH',os.path.join(conda_prefix,'lib','gdalplugins'))

from osgeo import gdal
driver = gdal.GetDriverByName("KEA")
if driver is None:
    raise Exception("ERROR: Could not import KEA in GDAL")
else:
    print("KEA driver recognised from Python")
