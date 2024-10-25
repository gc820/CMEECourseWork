#!/usr/bin/env python

"""List comprehensions 1"""

__appname__ = 'lc1.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

latin_names = [n for row in birds for n in [row[0]]]
print("Latin names:\n", latin_names)

common_names = [n for row in birds for n in [row[1]]]
print("Common names:\n", common_names)

mean_body = [n for row in birds for n in [row[2]]]
print("Mean body mass:\n", mean_body)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

latin_names2 = []
for row in birds: 
    for n in [row[0]]:
        latin_names2.append(n)
print("Latin names:\n", latin_names2)

common_names2 = []
for row in birds: 
    for n in [row[1]]:
        common_names2.append(n)
print("Common names:\n", common_names2)

mean_body2 = []
for row in birds: 
    for n in [row[2]]:
        mean_body2.append(n)
print("Mean body mass:\n", mean_body2)


# A nice example out out is:
# Step #1:
# Latin names:
# ['Passerculus sandwichensis', 'Delichon urbica', 'Junco phaeonotus', 'Junco hyemalis', 'Tachycineata bicolor']
# ... etc.
 