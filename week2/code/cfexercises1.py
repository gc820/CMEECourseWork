"""Writing a program with control flows"""

__appname__ = 'cfexercises1.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

#### Add docstring tests into here #####

import sys 
import doctest

def foo_1(x=5): # Defining the function 
    """Find the value of a number to the power of 0.5
    >>> foo_1(7)
    2.6457513110645907
    """
    return x ** 0.5

def foo_2(x=7, y=2):
    """Find whether x or y is larger
    >>> foo_2(6,4)
    6
    """
    if x > y:
        return x
    return y 

def foo_3(x=3, y=6, z=7):
    """Reorder input values x, y, z
    >>> foo_3(2,5,4)
    [2, 4, 5]
    """
    if x > y:
        tmp = y
        y = x
        x = tmp 
    if y > z: 
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo_4(x=5):
    """Computes the factorial number of x
    >>> foo_4(4)
    24
    """
    result = 1
    for i in range(1, x + 1):
        result = result * i 
    return result

def foo_5(x=3):
    """Recursive function that computes the factorial of x
    >>> foo_5(2)
    2
    """
    if x == 1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x=4):
    """Calculates the factorial of x using iterative loops
    >>> foo_6(2)
    2
    """
    facto = 1
    while x >=1: 
        facto = facto * x 
        x = x - 1 
    return facto 

def main(argv): # Defining the main program argument variable 
    print(foo_1(3))
    print(foo_2(5,8))
    print(foo_3(2,3,6))
    print(foo_4(3))
    print(foo_5(4))
    return 0 

if (__name__ == "__main__"):
    status = main(sys.argv)
    #sys.exit(status)

#Run with embedded tests 
doctest.testmod()  