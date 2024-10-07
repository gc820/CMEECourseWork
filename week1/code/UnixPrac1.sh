#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: UnixPrac1.sh
# Desc:  
# Arguments:  
# Date: Oct 2019

#1 Count the number of lines in each .fasta file 
for f in *.fasta;
    do 
        echo "Counting number of lines in $f"; 
        NumLines=`wc -l < "$f"`
        echo "Number of lines in file $f: $NumLines";
    done 

#2 Print everything from the 2nd line of the E.coli genome 
sed '1d' ../data/E.coli.fasta 

#3 Count sequence length of E.coli genome 
echo "E.coli sequence length:" 
sed '1d' ../data/E.coli.fasta | wc -c

#4 Count the number of matches in the E.coli sequence 
echo "Number of ATGC matches in the E.coli genome:"
sed '1d' ../data/E.coli.fasta | tr -d '\n' | grep -o "ATGC" | wc -l
 
 #5 AT/GC ratio 
awk 'NR >1{
    for (i=1;i<=length($0);i++){
    char=substr($0,i,1);
        if(char=="A"){A++;}
        else if (char=="T"){T++;}
        else if (char=="G"){G++;}
        else if (char=="C"){C++;}
        else if (char=="Y"){C+=0.5;T+=0.5}
        else if (char=="R"){A+=0.5;G+=0.5}
    }
}END{
    AT=A+T;
    GC=G+C;
    if(GC>0){
        ratio=AT/GC;
        print "AT/GC ratio:", ratio;
    }else{
        print "GC is zero, ratio undefined.";
    }
}' ../data/E.coli.fasta