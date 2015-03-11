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

while [ "$#" -gt 0 ]; do
  case $1 in
  --debug)
      set -x
      shift
      ;;
  --help)
      echo "USAGE: $0 [--debug] [--help] ID [ID [...]]"
      exit
      ;;
  *)
      ID=$1
      shift
      ;;
  esac
done


if [ ! -e $ID.pdb ]; then
  echo "Sorry, file $ID.pdb not found"
  exit
fi

bsub -o out.txt -e error.txt "cat pymol-var.pml | sed "s/PDBID/$ID/" | pymol -c -p" > /dev/null

until test -e $ID.png; do
  sleep 5
  echo "ID $ID still being processed..."
done

echo "ID $ID finished processing!"