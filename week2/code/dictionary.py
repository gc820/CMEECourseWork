#!/usr/bin/env python

"""Processes taxa list and creates a dictionary"""

__appname__ = 'dictionary.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.
# 
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. 
# OR, 
# 'Chiroptera': {'Myotis  lucifugus'} ... etc

#### Your solution here #### 
taxa_dict = {}
for species, group in taxa:
    taxa_dict.setdefault(group, []).append(species)
    # setdefault (key,[]) allows you to get the value of a key with a default value
    # ensures each key starts with an empty list so we can append values into it 
print(taxa_dict)

# Now write a list comprehension that does the same (including the printing after the dictionary has been created)  
 
#### Your solution here #### 
taxa_dict = {group: {species for species, g in taxa if g == group} for group in {g for _, g in taxa}}
# for group in {g for _, g in taxa}
        # Creates unique set of order names, iterates over each tuple 
        # g = group/order name to store, _ = species name (ignored)
        # {} set = eliminates duplicate order names 
# group: 
        # for each unique group/order in the set, associate a value (defined in the inner comprehension)
# {species for species, g in taxa if g == group} 
        # Set comprehension creates a set of species belonging to a particular group 
        # Iterate over each 'species, g' tuple in taxa
        # if g == group  
                # for each species in taxa, check group name matches current group of outer comprehension
                # if matches, include species in the set for the group/order
print(taxa_dict)

