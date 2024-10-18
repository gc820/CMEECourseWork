#!/usr/bin/env python3 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: basic_io2.py
# Desc: opens file and saves numbered list in a new file  
# Arguments: 0
# Date: Oct 2024

########################
# FILE OUTPUT 
########################

# Save the elements of a list to a file 
list_to_save = range(100)

f = open('../sandbox/testout.txt', 'w') #'w' will overwrite the file 
for i in list_to_save:
    f.write(str(i) + '\n') ## Add a new line at the end

f.close()
