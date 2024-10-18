#!/usr/bin/env python3 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: basic_io1.py
# Desc: opens and prints lines in input file  
# Arguments: 1
# Date: Oct 2024

#########################
# FILE INPUT 
#########################
# Open a file after reading 
f = open('../sandbox/test.txt', 'r')
# use "implicit" for loop: 
# if the object is a file, python will cycle over lines 
for line in f:
    print(line)

# close the file 
f.close()

# Same example, skip blank lines 
f = open('../sandbox/test.txt', 'r')
for line in f:
    if len(line.strip()) > 0: # checks stripped line has charaters left (i.e. skips blank lines)
        print(line)

f.close()

# N.B. strip() removes any leading and trailing whitespace
# e.g. spaces, tabs, newlines from a string (not modifying the og string)