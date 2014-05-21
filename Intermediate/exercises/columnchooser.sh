#!/bin/bash

if [ $# -lt 2 ]; then 

	echo ""
	echo "Not enough parameters given"
	echo "Please provide a filename and at least one column header"
	echo ""
	echo "Example: $0 datafile.csv COL1"
	echo ""
	exit 2

else

	FILE=$1
	COL=$2

#	echo "choosing column $COL from file $FILE"
	read -a HEAD <<< `head -n1 $FILE`
	NF=${#HEAD[@]}
#	echo ${HEAD[*]}
#	echo "Number of fields: $NF"
	for i in $(seq $NF)
	do
		COLHEAD=${HEAD[$i]}
		if [ "$COLHEAD" = "$COL" ]; then 
#			echo "$COLHEAD=$COL @ $i!"
			j=$[i+1]
			awk "{ print \$$j }" $FILE
		fi
	done

fi
