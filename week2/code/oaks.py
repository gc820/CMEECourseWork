"""Identifies oak species from a predefined list of taxa"""

__appname__ = 'oaks.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

## Finds just those taxa that are oak trees from a list of species 

taxa = [ 'Quercus robur',
         'Fraxinus excelsior',
         'Pinus sylvestris',
         'Quercus cerris',
         'Quercus petraea',
         ]

def is_an_oak(name):
    """Returns oak species"""
    return name.lower().startswith('quercus ') # Makes all names lowercase 

##Using for loops 
oaks_loops = set()
for species in taxa: 
    if is_an_oak(species): # Checks whether it is an oak 
        oaks_loops.add(species) # Adds to the empty set 
print(oaks_loops)

##Using list comprehensions 
oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

##Get names in UPPER CASE using for loops 
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species.upper()) # convert to uppercase characters
print(oaks_loops)

##Get names in UPPER CASE using list comprehensions 
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_lc)