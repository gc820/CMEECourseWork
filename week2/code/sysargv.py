"""Demonstrates the use of sys.argv module in python"""

__appname__ = 'sysargv.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

import sys
print("This is the name of the script: ", sys.argv[0])
print("Numer of arguments: ", len(sys.argv))
print("The arguments are: ", str(sys.argv))
