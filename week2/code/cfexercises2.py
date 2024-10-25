#!/usr/bin/env python

"""Functions utilizing control flows"""

__appname__ = 'cfexercises2.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

##########
def hello_1(x):
    """Numbers divisible by 3"""
    for j in range(x):
        if j % 3 == 0:
            print('hello')
    print(' ')

hello_1(12)

##########
def hello_2(x):
    """Numbers with remainders divisible by 4 and 5"""
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3:
            print('hello')
    print(' ')

hello_2(12)

##########
def hello_3(x, y):
    """Prints hello in range x,y"""
    for i in range(x, y):
        print('hello')
    print(' ')

hello_3(3,17)

##########
def hello_4(x):
    """Prints hello whilst x is less than 15"""
    while x != 15: # while x is not 15 
        print('hello')
        x = x + 3
    print(' ')

hello_4(0)

##########
def hello_5(x):
    """Print hello in ranges"""
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
    """Prints hello up to 6"""
    while x: 
        print("hello! " + str(y))
        y += 1 
        if y == 6: 
            break
    print(' ')

hello_6(True, 0)