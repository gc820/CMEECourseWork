#!/usr/bin/env python

"""
Basic script demonstrating how to extract data from a CSV file and print its contents, 
including skipping blank lines. Highlights file input and the use of loops to process 
file data.
"""

__appname__ = 'boilerplate.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

#########################
# FILE INPUT 
#########################

# Define the input file path
file_path = '../sandbox/test.txt'

# Use "implicit" for loop: 
# If the object is a file, python will cycle over lines 
with open(file_path, 'r') as f:  # Using `with open()` ensures the file is properly closed
    for line in f:  # Implicit for loop to iterate over each line
        print(line.strip())  # Print the line after stripping whitespace

# Same example, skip blank lines 
with open(file_path, 'r') as f:
    for line in f:  # Iterate over each line
        if len(line.strip()) > 0:  # Check if the line is not empty after stripping whitespace
            print(line.strip())  # Print non-blank lines

# N.B. strip() removes any leading and trailing whitespace
# e.g. spaces, tabs, newlines from a string (not modifying the og string)