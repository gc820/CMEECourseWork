#!/usr/bin/env python3 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: tuple.py
# Desc: example script using tuples 
# Arguments: 0
# Date: Oct 2024

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )

# Birds is a tuple of tuples of length three: latin name, common name, mass.
# write a (short) script to print these on a separate line or output block by
# species 
# 
# A nice example output is:
# 
# Latin name: Passerculus sandwichensis Common name: Savannah sparrow Mass: 18.7
# ... etc.

for latin_name, common_name, mass in birds:
    print(f"Latin name: {latin_name}, Common name: {common_name}, Mass: {mass}")
# f-strings = format the output of each species on different lines
# Allows insertion of expressions in {} within the string, with values inserted into the string 
