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
#%whos
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

#To run python code 

#Loops 
for i in range(10):
    print(i)

a = range(10) 
a

for i in range(1,6):
    print (i)

for i in range(2, 11, 2):
    print(i)

#Iterator vs iterable 
    #Iteratable = an object that can be iterated over 
    #Iterator = an object that can iterate over an iterable 

my_iterable = [1,2,3] 
type(my_iterable)

my_iterator = iter(my_iterable)
type(my_iterator)

next(my_iterator) #Same as my_iterator.__next__()
next(my_iterator)
next(my_iterator)
next(my_iterator)

#Functions 
def foo(x):
    x *= x  #same as x = x*x 
    print (x)
    return x
#%whos
foo(2)

def foo(x):
    x *= x 
    print(x)
    return x 
#If return is removed the output of foo can't be stored 

y=foo(x)
type(y)

#Control flow tools 
x =0; y = 2

if x < y: 
    print('yes')

if x: 
    print('yes')

if x==0:
    print('yes')

if y==2: 
    print('yes')

x = True

if x: 
    print('yes')

if x == True:
    print('yes')

#Comprehensions 
x = [i for i in range(10)]
print(x)

x = []
for i in range(10):
    x.append(i)
print(x)

x = [i.lower() for i in ["LIST", "COMPREHENSIONS", "ARE", "COOL"]]
print(x)

x = ["LIST","COMPREHENSIONS","ARE","COOL"]
for i in range(len(x)):
    x[i] = x[i].lower()
print(x)

x = ["LIST","COMPREHENSIONS","ARE","COOL"]
x_new = []
for i in x: 
    x_new.append(i.lower())
print(x_new)

matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = []
for row in matrix:
    for n in row: 
        flattened_matrix.append(n)
print(flattened_matrix)

matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = [n for row in matrix for n in row]
print(flattened_matrix)

words = ["These", "are", "some", "words"]
first_letters = set()
for w in words: 
    first_letters.add(w[0])
print(first_letters)
type(first_letters)

words = ["These", "are", "some", "words"]
first_letters = {w[0] for w in words}
print(first_letters)
type(first_letters)

#Variable scope 
i = 1
x = 0
for i in range(10):
    x += 1
print(i)
print(x)

i = 1
x = 0
i, x

for i in range(10):
    x += 1 

i = 1
x = 0
def a_function(y):
    x = 0
    for i in range(y):
        x += 1 
    return x, y
a_function(10)
print(i)
print(x)

x = a_function(10)
x
a_function(5)

#Global variables 
_a_global = 10 #a global variable 

if _a_global >= 5: 
    _b_global = _a_global + 5

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    _a_global = 4 #local variable 

    if _a_global >= 4: 
        _b_global = _a_global + 5 #local variable 
    
    _a_local = 3

    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)

a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)
print("After calling a_function, outside the function, the value of _a_local is ", __a_local)


_a_global = 10 

def a_function():
    _a_local = 4

    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)

a_function()

print("Outside the function, the value of _a_global is", _a_global)

#making a global variable available outside the function - use "global"
_a_global = 10

def a_function():
    global _a_global 
    _a_global = 5
    _a_local = 4
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)

a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

#Using global keyword inside nested functions 
def a_function():
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20 

    print("Before calling a_function2, value of _a_global is", _a_global)
    _a_function2()  
    print("After calling a_function2, value of _a_global is", _a_global)
a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)


_a_global = 10

def a_function():

    def _a_function2():
        global _a_global
        _a_global = 20
    print("Before calling a_function2, value of _a_global is", _a_global)
    
    _a_function2()

    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function()


print("The value of a_global in main workspace / namespace is", _a_global)


#Importance of the return directive 
def modify_list_1(some_list):
    print('got', some_list)
    some_list = [1, 2, 3, 4]
    print('set to', some_list)

my_list = [1, 2, 3]

print('before, my_list =', my_list)

modify_list_1(my_list)

print('after, my_list =', my_list)
#i.e. the function did not modify the list outside of the function 

def modify_list_2(some_list):
    print('got', some_list)
    some_list = [1, 2, 3, 4]
    print('set to', some_list)
    return some_list

my_list = modify_list_2(my_list)
print('after, my_list =', my_list)

def modify_list_3(some_list):
    print('got', some_list)
    some_list.append(4)
    print('changed to', some_list)

my_list = [1, 2, 3]

print('before, my_list =', my_list)

modify_list_3(my_list)

print('after, my_list =', my_list)


# Safely opening files using 'with open()'
with open("../path/to/file.txt", "r") as myfile:
    # do things to myfile 
    #...

###################
# FILE INPUT 
###################
# Open a file for reading 
with open('../sandbox/test/txt', 'r') as f: 
    # use "implicit" for loop:
    # if the object is a file, python will cycle over lines 
    for line in f: 
        print(line)

# Once you frop out of the with, the file is automatically closed 

# Same example, skip blank lines 
with open('../sandbox/test.txt', 'r') as f:
    for line in f: 
        if len(line.strip()) > 0: 
            print(line)




