#!/bin/bash
#
# unpacker.sh
# Single script to unpack a variety of different archives
# 


while [ "$#" -gt 0 ]
do
 case $1  in
  -h|--help)
	echo ""
	echo "Unpacks any file corresponding to its archive type"
	echo ""
	echo "Currently supports the following formats:"
	echo "bzip, gzip, zip"
	echo ""
	exit 2
  ;;
  *) FILE=$1
	  echo "processing file $FILE"
	  echo "test for existance of file $FILE"
	  if [ -f $FILE ]; then
		echo "file exists."
		TYPE=`file $FILE | cut -d: -f2 | awk '{print $1}'`
		case $TYPE in
			Zip)
				echo "file is ZIP file."
				unzip $FILE
			;;
			gzip)
				echo "file is gzip file."
				gunzip $FILE
			;;
			bzip2)
				echo "file is bzip2 file."
				bunzip2 $FILE
			;;
			*) echo "Unknown filetype"
			exit 2
		esac
		fi
  ;;
  esac
  shift

done
