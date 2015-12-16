#!/bin/bash

# Script to test the GZIP compression algorithms
# we use 9 different compression settings
# test it on a given file
# print the sizes of the resulting zipped file
# ideally, optionally we also test the time it takes to run

# USAGE: test_gzip_compression.sh file_to_test

# AUTHOR: Holger Dinkel <dinkel@embl.de>

# Configuration
GZIP='/usr/bin/gzip -f'

if [ -z $1 ]; then
	echo "ERROR: No filename given!"
	exit 1
elif [ ! -f $1 ];  then 
  echo "ERROR Filename $1 doesn't exist!"
  exit 1
fi

for i in $(seq 9);
do
  echo "Gzipping level $i"
  cp $1 testfile_level_$i
  time $GZIP -$i testfile_level_$i
done

# TODO: delete the temporary files

exit 0
