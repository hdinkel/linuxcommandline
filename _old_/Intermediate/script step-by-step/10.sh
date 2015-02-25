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

# process commandline parameters and arguments
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
      IDS=$*
      shift $#
      ;;
  esac
done

echo "Processing IDS $IDS"
EXITSTATUS=0

# Submit rendering job for all given IDs
#
for ID in $IDS; do
  if [ ! -e $ID.pdb ]; then
    echo "Sorry, file $ID.pdb not found"
  else
    bsub -o out.$ID.txt -e error.$ID.txt "cat pymol-var.pml | sed "s/PDBID/$ID/" | pymol -c -p" > /dev/null
    [ $? -ne 0 ] && EXITSTATUS=1
  fi
done


# check for the existence of processed .png files
#
ALLDONE=0
until test $ALLDONE -eq 1; do
    sleep 5
    ALLDONE=1
    for ID in $IDS; do
      if [ -e $ID.png ]; then
        echo "ID $ID finished processing!"
      else
        echo "ID $ID still being processed..."
        ALLDONE=0
      fi
    done
done

if [ $EXITSTATUS -ne 0 ]; then
  echo "An error occured..."
else
  echo "All done successfully"
fi

exit $EXITSTATUS
