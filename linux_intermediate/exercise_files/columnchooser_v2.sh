#! /usr/bin/bash
USAGE="columnchooser_v2.sh FILE COLNAME [COLNAME [...]]"
# AUTHOR: Toby Hodges (toby.hodges@embl.de)

if [ $# -lt 2 ]
then
    echo "USAGE: $USAGE"
    exit 1
fi

file=$1
shift
cols=$@

read -a headers <<< `head -n1 $file`
numfields=${#headers[@]}
declare -a outfields=()
declare -i matchnum=0
unmatched=""

for col in ${cols[@]}
do
    matched=0
    for colnum in $(seq $numfields)
    do
        if [ ${headers[$colnum-1]} = $col ]
        then
            outfields[$matchnum]="\$$colnum"
            matchnum=$(($matchnum+1))
            matched=1
        fi
    done
    if [ $matched = 0 ]
    then
        unmatched="$unmatched $col"
    fi
done
if [ $unmatched != "" ]
then
    echo "Sorry, no column(s) named $unmatched" 1>&2 
fi
awkfields=$(IFS=, ; echo "${outfields[*]}")
awk "{ print $awkfields }" $file
exit 0
