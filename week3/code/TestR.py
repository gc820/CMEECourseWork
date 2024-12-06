#!/usr/bin/env python

"""
A script to execute an R script (`TestR.R`) using Python's `subprocess` module.
"""

__appname__ = 'TestR.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

import subprocess
p = subprocess.Popen("Rscript --verbose TestR.R > ../results/TestR.Rout 2> ../results/TestR_errFile.Rout", shell=True).wait()