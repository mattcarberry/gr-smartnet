#!/usr/bin/sh
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/python
export PATH=/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/build/python:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export PYTHONPATH=/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/build/swig:$PYTHONPATH
/usr/bin/python2 /home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/python/qa_fsk_demod.py 
