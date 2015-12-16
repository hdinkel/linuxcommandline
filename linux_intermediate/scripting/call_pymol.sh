#!/bin/bash

# Script to call pymol to generate PNGs of all PDB files in current directory
# USAGE: call_pymol.sh

PYMOL='/g/software/bin/pymol-1.4.1 -c -p'

for FILE in *.pdb;
do
  echo $FILE
  sed "s/PDBFILE/${FILE/.pdb/}/" pymol-var.pml | $PYMOL
done


