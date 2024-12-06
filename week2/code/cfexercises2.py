#!/usr/bin/env python

"""
Functions demonstrating control flow structures in Python.

Each function showcases different ways of using loops (`for` and `while`) 
and conditional statements to print "hello" under specific conditions.
"""

__appname__ = 'cfexercises2.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

##########
def hello_1(x):
    """
    Prints "hello" for numbers divisible by 3 in the range 0 to x-1.

    Args:
        x (int): The upper limit of the range (exclusive).
    """
    for j in range(x):
        if j % 3 == 0:
            print('hello')
    print(' ')

hello_1(12)

##########
def hello_2(x):
    """
    Prints "hello" for numbers in the range 0 to x-1 that:
    - Leave a remainder of 3 when divided by 5.
    - Leave a remainder of 3 when divided by 4.

    Args:
        x (int): The upper limit of the range (exclusive).
    """
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3:
            print('hello')
    print(' ')

hello_2(12)

##########
def hello_3(x, y):
    """
    Prints "hello" for every number in the range [x, y).

    Args:
        x (int): The starting value of the range (inclusive).
        y (int): The ending value of the range (exclusive).
    """
    for i in range(x, y):
        print('hello')
    print(' ')

hello_3(3,17)

##########
def hello_4(x):
    """
    Prints "hello" while incrementing x by 3 until it equals 15.

    Args:
        x (int): The starting value.
    """
    while x != 15: # while x is not 15 
        print('hello')
        x = x + 3
    print(' ')

hello_4(0)

##########
def hello_5(x):
    """
    Prints "hello" for specific values of x in the range [x, 100):
    - Prints "hello" 7 times if x equals 31.
    - Prints "hello" once if x equals 18.

    Args:
        x (int): The starting value of the range.
    """
    while x <100:
        if x == 31:
            for k in range(7):
                print('hello')
        elif x == 18: 
            print('hello')
        x = x + 1
    print(' ')

hello_5(12)

##########
def hello_6(x, y):
    """
    Prints "hello! <y>" while incrementing y by 1, and stops when y equals 6.

    Args:
        x (bool): A placeholder argument (not actively used in logic).
        y (int): The starting value for the counter.
    """
    while x: 
        print("hello! " + str(y))
        y += 1 
        if y == 6: 
            break
    print(' ')

hello_6(True, 0)