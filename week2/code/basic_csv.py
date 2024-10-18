#!/usr/bin/env python3 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: basic_csv.py
# Desc: extracts species name and body mass from csv file
# Arguments: 0
# Date: Oct 2024

# Handling csv's 
import csv

# Read a file containing:
# 'Species', 'Infraorder', 'Family', 'Distribution', 'Body mass male (Kg)'
with open('../data/testcsv.csv', 'r') as f: 

    csvread = csv.reader(f) # reads in the csv file 
    temp = [] # Empty list to store rows as tuples
    for row in csvread: # Iterate over each row in csv file 
        temp.append(tuple(row)) # convert row (list) to tuple and add to tmp 
        print(row)
        print("The species is", row[0])

# write a file containing only species name and body mass 
with open('../data/testcsv.csv', 'r') as f:
    with open('../data/bodymass.csv', 'w') as g: 

        csvread = csv.reader(f)
        csvwrite = csv.writer(g)
        for row in csvread:
            print(row)
            csvwrite.writerow([row[0], row[4]])
