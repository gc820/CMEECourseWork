# CMEE Coursework: Week 2

## Description
Week 2 CMEE bootcamp coursework and class files: Python I code scripts and data.

## Languages
Python 3.12.3

## Dependencies
Requires Python 3.12.3 and utilizes the following standard library modules:
- `csv`: For handling CSV file operations.
- `sys`: For interacting with the Python interpreter and command-line arguments.
- `doctest`: For testing code embedded in docstrings.

No additional installations are necessary as these modules are included with Python's standard library.

## Project Structure and Usage
Project follows the structured bootcamp content covered within the module with code, data, results, and sandbox folders. All data to be run with Python scripts should be either put in the `data` directory or the relative path specified in the input. All script outputs are specified and should be kept in the `results` folder.

## Code Descriptions
- **align_seqs.py**: aligns 2 DNA sequences from a single CSV input file, and finds the highest matching alignment by shifting one sequence against the other and counting matching base pairs. It outputs the best alignment and its score to a text file in the results folder. 
  - **Input**: 2 DNA sequences from an input CSV file 
  - **Output**: best alignment and score to a `.txt` file 

- **basic_csv.py**: extracts species names and their body mass data from a CSV file and writes the results into a new file. It reads a CSV file containing information about species, infraorder, family, distribution, and body mass, and then outputs a CSV file with just the species names and corresponding body masses.
  - **Input**: CSV file 
  - **Output**: CSV file (species and body mass only) 

- **basic_io1.py**: opens a specified text file, reads its contents, and prints each line. It can also skip and ignore blank lines while printing.
  - **Input**: txt file 
  - **Output**: Prints each file to the console 

- **basic_io2.py**: creates a numbered list of values (from 0 to 99) and writes them to a new text file, with each number on a separate line.
  - **Input**: N/A
  - **Output**: The script saves the numbered list (0-99) in the file `../sandbox/testout.txt`, with each number written on a new line.

- **basic_io3.py**: demonstrates how to serialize a dictionary to a file (save it for later use) and then deserialize it (load it back) using the `pickle` module. The data is saved and loaded in binary format.
  - **Input**: The script works with a predefined dictionary.
  - **Output**: Serialized File: The dictionary is saved as a binary file at `../sandbox/testp.p`. Deserialized Data: The script reloads the dictionary from the file and prints it to the console.

- **boilerplate.py**: an example of a basic Python module or program with functions, and can be used as a starting template for creating new Python scripts. The script includes a `main()` function, basic command-line interface handling, and an example print statement.
  - **Input**: The script expects 1 argument, but the current implementation does not utilize it.
  - **Output**: Prints a simple message, "This is a boilerplate," when executed.

- **cfexercises1.py**: contains several functions that demonstrate the use of control flow (conditionals, loops) and recursion. The script includes embedded doctests to verify the correctness of the functions, allowing the user to test the program's output against expected results.
  - **Input**: designed to take 6 arguments, though they are not actively used in the current implementation. The functions within the script accept numerical values as inputs directly.
  - **Output**: The script prints the results of the control flow functions. Embedded doctests validate the correctness of the functions by running pre-defined test cases. 

- **cfexercises2.py**: series of functions that utilize control flow (loops and conditionals) to print the word "hello" under various conditions. Each function demonstrates different control structures and logic.
  - **Input**: 6 command-line argument, accepting numerical input x (or y in some cases). 
  - **Output**: each function prints "hello" based on the specific logic defined within the function. 

- **control_flow.py**: various numeric functions that utilize control statements. Each function performs specific numerical operations and returns results based on the input provided.
  - **Input**: script can accept an argument, though it does not actively use it within the functions in their current implementation.
  - **Output**: The script prints results of the various functions directly to the console.

- **debugme.py**: demonstrates the use of exception handling and debugging techniques in Python. The script includes a function that performs a calculation but is prone to errors, particularly division by zero.
  - **Input**: The script accepts an argument representing the initial value of x.
  - **Output**: Prints messages when division by zero occurs, unexpected errors with values of x/y, successful calculation messages when no errors occur. 

- **dictionary.py**: processes a list of taxa and creates a dictionary that maps taxonomic group names (such as orders) to sets of species. It demonstrates the use of both loops and list comprehensions in Python to achieve this.
  - **Input**: N/A, predefined list of tuples containing species names and their respective taxonomic groups. 
  - **Output**: prints 2 dictionaries to the console. 

- **lc1.py**: extracts information about bird species using both list comprehensions and conventional loops. The data is organized into a list of tuples, each containing the Latin name, common name, and mean body mass of various birds.
  - **Input**: N/A, uses predefined list of tuples. 
  - **Output**: Prints lists to the console. 

- **lc2.py**: processes rainfall data for the UK in 1910, providing an analysis of rainfall amounts by month. The data is stored in a tuple of tuples, where each inner tuple contains a month and the corresponding average rainfall. The script demonstrates how to extract information using both list comprehensions and conventional loops.
  - **Input**: N/A, predefined tuple containing rainfall data.
  - **Output**: prints to the console. 

- **loops.py**: provides examples of both for loops and while loops, illustrating how to iterate over different data structures and perform simple arithmetic operations.
  - **Input**: N/A, predefined data structures. 
  - **Output**: The script prints the values of integers in a specified range. It iterates through a mixed list, printing each element. It calculates the total of a list of summands and prints the cumulative total at each step. It increments a variable in a while loop until it reaches 100, printing the variable's value at each iteration.

- **MyExampleScript.py**: demonstrates the use of functions in Python. The script defines a function named `foo` that takes a single argument, squares it, and prints the result.
  - **Input**: numerical value (integer or float)
  - **Output**: prints the square of the input value 

- **oaks.py**: identifies oak tree species from a predefined list of taxa. It demonstrates the use of loops and list comprehensions in Python to filter and manipulate the data. The script includes functionality to output the names of oak trees in both standard and uppercase formats.
  - **Input**: N/A, list of species names within the script
  - **Output**: prints set of oak species. 

- **oaks_debugme.py**: reads a CSV file containing taxa data and identifies oak species based on the genus name. It outputs the oak species to a new CSV file. The script includes basic testing for the function that checks if a species is an oak using Python's `doctest` module.
  - **Input**: does not take command-line arguments but reads from a predefined CSV file.
  - **Output**: writes the identified oak species to a new CSV file: `../data/JustOaksData.csv`.

- **scope.py**: demonstrates the concept of variable scope in Python, particularly focusing on global and local variables. It showcases how variables can be defined and accessed within functions, and how to use the `global` keyword to modify global variables inside a function. The script also illustrates the behavior of nested functions regarding variable scope.
  - **Input**: N/A
  - **Output**: produces a series of print statements that illustrate the values of global and local variables at various points during execution.

- **sysargv.py**: demonstrates the use of the `sys.argv` module in Python, which is used to retrieve command-line arguments passed to the script. The script prints the name of the script, the number of arguments provided, and the arguments themselves.
  - **Input**: N/A
  - **Output**: script produces the name of the script being executed, the total count of command-line arguments, including the script name itself and a string representation of the list of arguments passed to the script.

- **test_control_flow.py**: contains functions that exemplify the use of control statements in Python. It includes a function to determine whether a given number is even or odd. The script utilizes `doctest` to run embedded tests that verify the correctness of the `even_or_odd` function.
  - **Input**: 1 (The script accepts one optional argument, x, which represents the number to be tested. If no argument is provided, it defaults to 0).
  - **Output**: message indicating whether the specified number is even or odd. The output will depend on the hardcoded values within the main function.

- **tuple.py**: demonstrates the use of tuples in Python by creating a collection of bird species. Each species is represented as a tuple containing its Latin name, common name, and average body mass. The script iterates over this collection and prints the details of each bird in a formatted output.
  - **Input**: N/A, the script does not accept any command-line arguments. It uses a predefined tuple of bird species.
  - **Output**: prints the Latin name, common name, and mass of each bird species in the collection. Each bird's details are displayed on a separate line.

- **using_name.py**: demonstrates the use of the special variable `__name__` in Python. The `__name__` variable indicates whether the script is being run as the main program or being imported as a module in another script. Depending on the context in which it is run, the script will print different messages.
  - **Input**: N/A, the script does not accept any command-line arguments.
  - **Output**: prints vary depending on whether it is executed directly or imported into another script.

## Data
- `bodymass.csv`
- `JustOaksData.csv`
- `testcsv.csv`
- `TestOaksData.csv`

## Results
All results from the scripts will be saved in the `results` folder.

## Author
Georgina Chow  
Email: [georgina.chow20@imperial.ac.uk](mailto:georgina.chow20@imperial.ac.uk)

