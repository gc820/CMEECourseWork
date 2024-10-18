"""Basic script extracting data from a csv file and appending it to an output file 
"""

__appname__ = 'boilerplate.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

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