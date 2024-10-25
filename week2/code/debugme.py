#!/usr/bin/env python

"""Demonstration of deugging techniques in python programs"""_

__appname__ = 'debugme.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

def buggyfunc(x): # Define the degging function 
    """Debugging function"""
    y = x 
    for i in range(x):
        try: # used to handle exceptions (errors) that may occur
            y = y-1
            #import ipdb; ipdb.set_trace() # imports debugger module 
            z = x/y
        except ZeroDivisionError: 
            print(f"The result of dividing a number by zero is undefined")
        except:
            print(f"This didn't work; {x = }; {y = }")
        else: 
            print(f"OK; {x = }; {y = }; {z = };")
    return z

buggyfunc(20) # Testing the function 

# type q to quit from the debugger 
# %pdb = use to turn on debugging 
    # Then run the script in the terminal 