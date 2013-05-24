#!/bin/sh

bsub -o out.txt -e error.txt "cat pymol.pml | pymol -c -p"