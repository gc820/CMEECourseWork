"""Basic python program creating a numbered list of values (0 to 99)"""

__appname__ = 'basic_io2.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

########################
# FILE OUTPUT 
########################

# Save the elements of a list to a file 
list_to_save = range(100)

f = open('../sandbox/testout.txt', 'w') #'w' will overwrite the file 
for i in list_to_save:
    f.write(str(i) + '\n') ## Add a new line at the end

f.close()
