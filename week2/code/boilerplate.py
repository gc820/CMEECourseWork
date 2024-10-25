#!/usr/bin/env python

"""Description of this program or application. 
You can use several lines""" 

__appname__ = 'basic_io1.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

## imports ## 
import sys # module to interface our program with the operating system 

## constants ## 

## functions ## 
def main(argv):
    """" Main entry point of the program """
    print('This is a boilerplate') # NOTE: indented using two tabs or 4 spaces 
    return 0 

if __name__ == '__main__':
    """Makes sure the "main" function is called from the command line"""
    status = main(sys.argv)
    #sys.exit("I am exiting right now!")
    sys.exit(status)
