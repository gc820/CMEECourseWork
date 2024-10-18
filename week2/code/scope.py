#!/usr/bin/env python3 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: scope.py
# Desc:  defines functions and takes global variables to check their scope within functions
# Arguments: 0
# Date: Oct 2024

#Global variables 
_a_global = 10 #a global variable 

if _a_global >= 5: 
    _b_global = _a_global + 5

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    _a_global = 4 #local variable 

    if _a_global >= 4: 
        _b_global = _a_global + 5 #local variable 
    
    _a_local = 3

    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)

a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)
#print("After calling a_function, outside the function, the value of _a_local is ", __a_local)


_a_global = 10 

def a_function():
    _a_local = 4

    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)

a_function()

print("Outside the function, the value of _a_global is", _a_global)

#making a global variable available outside the function - use "global"
_a_global = 10

def a_function():
    global _a_global 
    _a_global = 5
    _a_local = 4
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)

a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

#Using global keyword inside nested functions 
def a_function():
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20 

    print("Before calling a_function2, value of _a_global is", _a_global)
    _a_function2()  
    print("After calling a_function2, value of _a_global is", _a_global)
a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)


_a_global = 10

def a_function():

    def _a_function2():
        global _a_global
        _a_global = 20
    print("Before calling a_function2, value of _a_global is", _a_global)
    
    _a_function2()

    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function()


print("The value of a_global in main workspace / namespace is", _a_global)