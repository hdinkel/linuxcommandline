#!/bin/sh

# script xyz.sh - render PDB files with PyMOL
#
# Author: Frank Thommen, EMBL Heidelberg
# Date:   22-May-2013
# License: Take it or leave it
#
# Changes:
#
#

if [ ! -e 4A8J.pdb ]; then
  echo "Sorry, file 4A8J.pdb not found"
  exit
fi

bsub -o out.txt -e error.txt "cat pymol.pml | pymol -c -p"