#!/usr/bin/env python

"""
Demonstration of debugging techniques in Python programs.

This script demonstrates:
1. The use of try-except blocks to handle exceptions.
2. Debugging with the `ipdb` module for interactive debugging.
3. Testing a function with intentional issues to learn debugging techniques.
"""_

__appname__ = 'debugme.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

def buggyfunc(x): # Define the degging function 
    """
    Function designed to demonstrate debugging techniques.

    Args:
        x (int): A positive integer to be decremented in a loop.

    Returns:
        z (float): The result of dividing x by y, where y is decremented in each loop iteration.

    This function includes intentional issues to showcase:
    - Handling exceptions with try-except blocks.
    - Debugging using the `ipdb` module.
    """
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