"""Basic program how to serialize and deserialize a dictionary"""

__appname__ = 'basic_io3.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

########################
# STORING OBJECTS
########################
# To save an object (even complex) for later use 
my_dictionary = {"a key": 10, "another key": 11}

import pickle 
f = open('../sandbox/testp.p', 'wb') ## not the b: accept binary files 
pickle.dump(my_dictionary, f) # Serialize the dictionary & write it to the file 
f.close()

# Opening the file in binary write mode ('wb') to allow writing of binary data 
# (pickled dictionary)

## Load the data again 
f = open('../sandbox/testp.p', 'rb')
another_dictionary = pickle.load(f) # Deserialize the data from the file
f.close()

print(another_dictionary)

# 'rb' opens the file for reading in binary mode 