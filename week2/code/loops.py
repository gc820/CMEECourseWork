#!/usr/bin/env python

"""
Demonstrates a variety of loop structures in Python, including for loops, while loops,
nested loops, and loop control using break, continue, and pass.
1. Simple for and while loops.
2. Nested loops.
3. Loop control with break, continue, and pass.
4. Complex infinite loops with conditions.
"""

__appname__ = 'loops.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

#Loop examples 
# FOR loops 
for i in range(5): # Iterates through numbers 0 to 4
    print(i)

my_list = [0,2,"geronimo!", 3.0, True, False]
for k in my_list: # Iterates through elements of the list
    print(k)

total = 0
summands = [0, 1, 11, 111, 1111]
for s in summands:  # Iterates through the list and adds each element to total
    total += s
    print(f"Running total: {total}")

# WHILE loop 
z = 0
while z < 5:  # Runs while z is less than 5
    print(f"z = {z}")
    z += 1

# Nested FOR loops 
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
for row in matrix:  # Iterates through each row in the matrix
    for val in row:  # Iterates through each value in the row
        print(val, end=" ")  # Print values in the same line
    print()  # Move to the next line after finishing a row

# Using break
for i in range(10):  # Iterates from 0 to 9
    if i == 5:
        print("Breaking the loop at i = 5")
        break  # Exit the loop
    print(i)

# Using continue
print("\nUsing CONTINUE:")
for i in range(10):  # Iterates from 0 to 9
    if i % 2 == 0:
        continue  # Skip the rest of the loop body for even numbers
    print(f"Odd number: {i}")

# Using pass
print("\nUsing PASS:")
for i in range(3):  # Iterates from 0 to 2
    if i == 1:
        pass  # Placeholder that does nothing; the loop continues
    print(f"i = {i} (PASS used at i == 1)")

# Complex While Loop with Conditional Break
x = 0
while True:  # Infinite loop
    x += 1
    print(f"x = {x}")
    if x >= 3:  # Break the loop if x is 3 or greater
        print("Breaking the loop as x >= 3")
        break