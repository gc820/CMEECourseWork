#!/usr/bin/env python

"""Program to find the best alignment of 2 DNA sequences"""

__appname__ = 'align_seqs.py'
__author__ = 'Georgina Chow (georgina.chow20@imperial.ac.uk)'
__version__ = '3.12.3'

import csv # module to read/write/investigate csv files 
import sys # module to interface our program with the operating system 
import os


def parse_arguments():
    """Parse and validate command-line arguments."""
    if len(sys.argv) < 2:
        print("Usage: align_seqs.py <input_file.csv>")
        sys.exit(1)
    input_file = '../data/' + sys.argv[1] # Input csv provided 
    return input_file


def validate_file(input_file):
    """Check if the input file is correct."""

    # Check if the input file is a csv file
    if not input_file.endswith('.csv'):
        print("Error: The file provided is not a csv file. Please make sure the input file is in a csv format.")
        sys.exit(1)
    
    # Check if the input file exists
    if not os.path.isfile(input_file):
        print(f"Error: The file '{input_file}' does not exist. Please enter another input file.")
        sys.exit(1)
    
    # Check if the file is empty 
    if os.path.getsize(input_file) == 0:
        print(f"Error: The file '{input_file}' is empty. Please provide another input file.")
        sys.exit(1)


def read_sequences(input_file):
    """Read DNA sequences from input file."""
    # Read in DNA sequences from the csv file 
    with open(input_file, 'r') as f:
        reader = csv.reader(f)
        sequences = list(reader)

    try:
    # Take sequences from the 1st and 2nd rows 
        seq1 = sequences[0][0] #First row, first column
        seq2 = sequences[1][0] #Second row, first column 
    
    except IndexError:
        print("Error: The input file does not contain two valid sequences. Make sure seq 1 and 2 are on rows 1 and 2.")
        sys.exit(1)
    
    seq1 = sequences[0][0].strip()  # Remove leading/trailing whitespace
    seq2 = sequences[1][0].strip()
    return seq1, seq2 

        

def assign_sequences(seq1, seq2):
    """Assign the longer sequence to s1 and the shorter to s2."""
    if len(seq1) >= len(seq2):
        return seq1, seq2, len(seq1), len(seq2)
    else:
        return seq2, seq1, len(seq2), len(seq1)
    # Assign the longer sequence s1, and the shorter to s2
    # l1 is length of the longest, l2 that of the shortest


def write_results(output_file, my_best_align, s1, my_best_score):
    """Write the best alignment and score to an output file."""
    with open(output_file, 'w') as f: 
        f.write(f"Best alignment: \n{my_best_align}\n")
        f.write(f"Original sequence 1: \n{s1}\n")
        f.write(f"Score: {my_best_score}\n")

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)
def calculate_score(s1, s2, l1, l2, startpoint):
    """Calculates the DNA sequence alignment score"""
    matched = "" # to hold string displaying alignements
    score = 0 # tracks the number of matches
    for i in range(l2): # Iterates over the length of the shorter s2 seq 
        if (i + startpoint) < l1: 
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*" # Adds * to matched string
                score += 1 
            else:
                matched = matched + "-"
    # some formatted output
    # Alignment visualisation - print 'matched' 
    print("." * startpoint + matched) #No. (.) equal to startpoint to shift the alignment        
    # s2 (shorter) printed after shifted by startpoint to line up with s1
    print("." * startpoint + s2) 
    print(s1)
    print(score) # No. of matches 
    print(" ") #Empty line for visual separation 

    return score #Count of matches between s1 and s2 from the startpoint

# Test the function with some example starting points:
#calculate_score(s1, s2, l1, l2, 0)
#calculate_score(s1, s2, l1, l2, 1)
#calculate_score(s1, s2, l1, l2, 5)

# Try to find the best match (highest score) for the two sequences
def align_seqs(s1, s2, l1, l2):
    """Aligns DNA sequences from an input file and finds the best alignment"""
    my_best_align = None # holds string representaion of best alignment
    my_best_score = -1 # store highest score so far (-1 to be lower than any possible score)

    # Finding the best alignment - try every poss alignment of s2 rel to s1
        # starting from each possible startpoint (0 to l1-1)
    for i in range(l1 - l2 +1): # Ensure valid start points for shorter sequence
        # Note that you just take the last alignment with the highest score
        current_score = calculate_score(s1, s2, l1, l2, i) # current_score=No. matches for alignment
        if current_score > my_best_score:
            # Aligns s2 with shift of i(.) characters (account for startpoint)
            my_best_align = "." * i + s2 
            my_best_score = current_score # Updates with new best score
        
    return my_best_align, my_best_score # Return best alignment after all iterations 


def main(): # Defining the main function  of the program 
    """Main function to orchestrate the DNA alignment process."""
    input_file = parse_arguments()
    validate_file(input_file)

    seq1, seq2 = read_sequences(input_file)
    s1, s2, l1, l2 = assign_sequences(seq1, seq2)

    my_best_align, my_best_score = align_seqs(s1, s2, l1, l2)

    output_file = "../results/dna_alignment_results.txt" # Output txt file 
    write_results(output_file, my_best_align, s1, my_best_score)
    
    # Print to the console 
    print(f"Best alignment: \n{my_best_align}")
    print(f"Original sequence 1: \n{s1}")
    print(f"Score: {my_best_score}")


if (__name__ == "__main__"):
    main() # 'main' function is called when the script is run directly
