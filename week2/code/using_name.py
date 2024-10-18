"""Demonstrates use of special __name__ variable in Python"""

__appname__ = 'using_name.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

if __name__ == '__main__': # Checking if the main function of the program is the current one (name)
    print('This program is being run by itself!')
else: 
    print('I am being imported from another script/program/module!')

print("This module's name is: " + __name__)
