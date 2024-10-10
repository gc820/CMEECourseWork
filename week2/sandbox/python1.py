#Basic operations 
y=2
x='My string '
x + 'now has more stuff' 
x + str(y)
z='88'
x+z
y + int(z) 

#Lists
MyList = [3,2.44,'green',True]
MyList[1]
MyList[0]
MyList[2]
MyList.append('a new item')
%whos
type(MyList)
print(type(MyList))
del MyList[2]
MyList.append(True)
MyList

#Tuples (immutable objects)
MyTuple = ("a", "b", "c")
print(MyTuple)
type(MyTuple)
MyTuple[0]
len(MyTuple)

FoodWeb=[('a','b'), ('a','c'), ('b','c'), ('c','c')]
FoodWeb
FoodWeb[0]
FoodWeb[0][0]
FoodWeb[0][0] = "bbb"  #will not work - tuples='immutable'
FoodWeb[0] = ("bbb", "ccc")

a = (1, 2, [])
a[2].append(1000)
a
a[2].append((100,10))
a = (1,2,3)
b = a + (4,5,6)
b
c = b[1:]
c
a = ("1", 2, True)
a

#Sets
a = [5,6,7,7,7,8,9,9]
b = set(a)
b
c = set([3,4,5,6])
b & c #intersection 
b | c #union 

    # a - b  a.difference(b)
    # a <= b  a.issubset(b)
    # a >= b  b.issubset(a)
    # a & b  a.intersection(b)
    # a|b  a.union(b)

#Dictionaries 
GenomeSize = {'Homo sapiens': 3200.0, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0}
GenomeSize['Escherichia coli'] = 4.6
GenomeSize['Homo sapiens'] = 3201.1
GenomeSize

# If your elements/data are unordered and indexed by numbers use a list
# If you’re defining a constant set of values (or ordered sequences) and all you’re ever going to do with them is iterate through them, use a tuple.
# If you want to perform set operations on data, use a set
# If they are unordered and indexed by keys (e.g., names), use a dictionary


#Copying mutable objects 
a = [1,2,3]
b =  a
a.append(4)
print(a)
print(b)

a = [1,2,3]
b = a[:] #"Shallow" copy, one level deep 
a.append(4)
print(a)
print(b)

a = [[1,2],[3,4]]
b = a[:]
print(a)
print(b)
a[0][1] = 22
print(a)
print(b)

import copy

a = [[1,2], [3,4]]
b = copy.deepcopy(a)
a[0][1] = 22
print(a)
print(b)

# Need deepcopy to copy and existing object/variable and assign a new name to the copy 
    #Shallow copy won't create objects that are independent clones 
    #Deepcopy will create clones of the original (independent of the original)


#Python with strings 
s = " this is a string "
len(s) 
s.replace(" ", "-")  #Substitues spaces with '-'
s.find("s")  #First occurence of 's'
s.count("s")  #Counts the number os 's'
t = s.split()  #Splots string using spaces, makes a list
t = s.split(" is ")  #Splits string using 'is', makes a list 
t = s.strip()  #Removes trailing spaces
t
s.upper()
s.upper().strip()
'WORD'.lower()

# Writing/testing/running python code
for i in range(x):
    if i > 3:
        print(i)

x = 11

#Loops 
for i in range(10):
    print(i)