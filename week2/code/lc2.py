#!/usr/bin/env python

"""List comprehensions 2"""

__appname__ = 'lc2.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.

rainfall_100mm = tuple ([n for n in rainfall if n[1] > 100]) #converts to a tuple object 
print("Months and rainfall values when the amount of rain was greater than 100mm:\n", rainfall_100mm)

# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

rainfall_50mm = tuple ([n for n in rainfall if n[1] < 50])
print("Months and rainfall values when the amount of rain was less than 50mm:\n", rainfall_50mm)

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

rainfall_100mm_2 = []
for n in rainfall: 
    if n[1] > 100: # only append if rainfall values are more than 100 
        rainfall_100mm_2.append(n)
rainfall_100mm_2 = tuple(rainfall_100mm_2)
print("Months and rainfall values when the amount of rain was greater than 100mm:\n", rainfall_100mm)

rainfall_50mm_2 = []
for n in rainfall: 
    if n[1] < 50: 
        rainfall_50mm_2.append(n)
rainfall_50mm_2 = tuple(rainfall_50mm_2)
print("Months and rainfall values when the amount of rain was less than 50mm:\n", rainfall_50mm)

# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.

