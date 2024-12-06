#!/usr/bin/env python

"""Basic python program creating a numbered list of values (0 to 99)"""

__appname__ = 'basic_io2.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

########################
# FILE OUTPUT 
########################

# Save the elements of a list to a file 
list_to_save = range(100)

try:
    with open('../results/testout.txt', 'w') as f: #'w' will overwrite the file 
        for i in list_to_save:
            f.write(f"{i}\n") ## Add a new line at the end
except FileNotFoundError:
    print("Error: The directory '../results/' does not exist.")
except PermissionError:
    print("Error: Permission denied when trying to write to the file.")
