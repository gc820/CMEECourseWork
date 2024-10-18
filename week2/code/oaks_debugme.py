#!/usr/bin/env python3
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: oaks_debugme.py
# Desc: finds the oak species in a csv file 
# Arguments: 1
# Date: Oct 2024

import csv
import sys
import doctest
 
#Define function
def is_an_oak(name):
    """ Returns True if name is starts with 'quercus' 
    >>> is_an_oak('quercuss')
    False
    >>> is_an_oak('quercus')
    True
    >>> is_an_oak('Fagus sylvatica')
    False
    >>> is_an_oak('Quercus robur')
    True
    >>> is_an_oak('querc')
    False
    """

    # Normalize the input by stripping whitespace and converting to lowercase
    normalized_name = name.lower().strip()
    return normalized_name == 'quercus' or normalized_name.startswith('quercus ')
    # Checks for both exact matches of quercus 

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../results/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()

    next(taxa) # Skips the header row 

    for row in taxa:
        print(row)
        print ("The genus is:") 
        print(row[0] + '\n')
        
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            #import ipdb; ipdb.set_trace()
            csvwrite.writerow([row[0], row[1]])    
    f.close()
    g.close()

    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()
