#!/usr/bin/env python

"""Demonstrates the use of sys.argv module in python
The script prints information about the arguments passed to the command line. 
It demonstrates:
1. Accessing the name of the script using `sys.argv[0]`.
2. Counting the number of arguments passed using `len(sys.argv)`.
3. Printing the list of arguments.

Example Output:
    This is the name of the script: sysargv.py
    Number of arguments: 4
    The arguments are: ['sysargv.py', 'arg1', 'arg2', 'arg3']
"""

__appname__ = 'sysargv.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

import sys # Import module for accessing command-line arguments

if len(sys.argv) < 2:
    print("Usage: python3 sysargv.py <argument1> [argument2 ...]")
    sys.exit(1)

# Print the name of the script
print("This is the name of the script: ", sys.argv[0])
# Print the number of arguments passed
print("Numer of arguments: ", len(sys.argv))
# Print the list of all arguments
print("The arguments are: ", str(sys.argv))
