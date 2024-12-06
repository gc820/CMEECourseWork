#!/usr/bin/env python

"""
Basic program demonstrating how to handle CSV files in Python.

This script covers:
1. Reading a CSV file using the `csv.reader` module.
2. Extracting specific data from the CSV file and processing it.
3. Writing selected data into a new CSV file.
"""

__appname__ = 'basic_csv.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

# Handling csv's 
import csv

# Input and output file paths
input_file = '../data/testcsv.csv'
output_file = '../data/bodymass.csv'

# Read a file containing:
# 'Species', 'Infraorder', 'Family', 'Distribution', 'Body mass male (Kg)'
with open(input_file, 'r') as f: 
    csvread = csv.reader(f) # reads in the csv file 
    temp = [] # Empty list to store rows as tuples
    for row in csvread: # Iterate over each row in csv file 
        temp.append(tuple(row)) # convert row (list) to tuple and add to tmp 
        print(row)
        print("The species is", row[0])

# write a file containing only species name and body mass 
with open(input_file, 'r') as f:
    with open(output_file, 'w') as g: 
        csvread = csv.reader(f)
        csvwrite = csv.writer(g)
        for row in csvread:
            print(row)
            csvwrite.writerow([row[0], row[4]])