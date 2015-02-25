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

ID=4A8J

if [ ! -e $ID.pdb ]; then
  echo "Sorry, file $ID.pdb not found"
  exit
fi

bsub -o out.txt -e error.txt "cat pymol-var.pml | sed "s/PDBID/$ID/" | pymol -c -p"