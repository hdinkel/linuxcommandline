#!/bin/bash
#
# backupscript.sh
# script to backup a given directory to the global Backup directory
# 

BACKUPDIR=~/BACKUPS

if [ ! $# -eq 1 ]; then 

	echo ""
	echo "No directory given"
	echo "Please provide the name of a directory to backup"
	echo "If the name contains spaces, please use quotes."
	echo ""
	echo "Example: $0 'directory name'"
	echo ""
	exit 2

else

	DIR=$1
	DATE=`date +%Y%M%d_%H%m`

# checking for existence of BACKUPDIR:
	if [ ! -d $BACKUPDIR ]; then
		echo "Backup directory $BACKUPDIR does not exist. Creating it now..."
		mkdir $BACKUPDIR
	fi

	BACKUPNAME=`echo $DIR | sed -e 's/\/$//' -e 's/^.\///' -e 's/\//_/g'`
	BACKUPNAME=${BACKUPNAME}_${DATE}.tar.gz
	echo "Backing up $DIR to $BACKUPDIR/$BACKUPNAME"
	tar -czf $BACKUPDIR/$BACKUPNAME $DIR 2>&1 | grep -v "Removing"
	echo "Done"
	ls -lah  $BACKUPDIR/$BACKUPNAME
fi
