#!/bin/sh 
# 
# myscript.sh
# General purpose script for extracting Glycine
# occurrences in a datafile.
# Usage: myscript.sh datafile
# Exit values: 
#    1: No datafile given or file doesn’t exist
#    2: No Glycine found
#
# Author: Me, myself and I
# Date: Heidelberg, December 12., 2012
# 
# --- Configuration ---
GREPCMD=/bin/grep
DATAFILE=$1
# --- Check prerequisites ---
# first check for $1
if [ -z $DATAFILE ]
then
    echo “No datafile given” 1>&2 # print on STDERR
    echo “USAGE: $0 datafile”
    exit 1
fi
# then check if the file exists
if [ ! -f $DATAFILE ]
then
    echo “Datafile $DATAFILE does not exist!” 1>&2
    exit
fi
# --- Now processing---
$GREPCMD –q Glycine $DATAFILE # Where is Glycine?
# --- Exit ---
if [ $? –eq 0 ]
then
    exit 0
else
    exit 2
fi
