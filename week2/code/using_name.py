#!/usr/nin/env python3
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: using_name.py 
# Desc: showing the use of the name and main values assigned when running a program/module 
# Arguments: 0
# Date: Oct 2024

if __name__ == '__main__': # Checking if the main function of the program is the current one (name)
    print('This program is being run by itself!')
else: 
    print('I am being imported from another script/program/module!')

print("This module's name is: " + __name__)
