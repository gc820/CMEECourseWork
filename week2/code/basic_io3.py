#!/usr/bin/env python

"""
Basic program demonstrating how to serialize and deserialize a dictionary in Python.

Serialization (using `pickle`) allows you to save complex Python objects like dictionaries
to a file for later use. This script includes:
1. Saving (serializing) a dictionary to a binary file.
2. Loading (deserializing) the dictionary back into memory.
"""

__appname__ = 'basic_io3.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

########################
# STORING OBJECTS
########################

import pickle # Module for serializing and deserializing Python objects

# To save an object (even complex) for later use 
my_dictionary = {"a key": 10, "another key": 11}

# Serialize the dictionary and save it to a binary file
with open('../sandbox/testp.p', 'wb') as f:  # Open in binary write mode ('wb')
    pickle.dump(my_dictionary, f)  # Serialize and write the dictionary to the file


# Opening the file in binary write mode ('wb') to allow writing of binary data 
# (pickled dictionary)

# Load (deserialize) the dictionary from the file
with open('../sandbox/testp.p', 'rb') as f:  # Open in binary read mode ('rb')
    another_dictionary = pickle.load(f)  # Deserialize the dictionary from the file

print(another_dictionary)

# 'rb' opens the file for reading in binary mode 