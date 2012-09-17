cd exercise_10

################################################################################
# Create a directory called testpermissions
################################################################################
mkdir testpermissions

################################################################################
# Change your working directory to testpermissions
################################################################################
cd testpermissions

################################################################################
# Create a directory called adir.
################################################################################
mkdir adir

################################################################################
# Use the command which date to find out where the date program is located.
################################################################################
which date
/bin/date

################################################################################
# Copy the date program into adir.
################################################################################
cp /bin/date adir/


################################################################################
# check the permissions of the program date
################################################################################
ls -la adir/date
-rwxr-xr-x 1 dinkel gibson 54916 Sep 17 13:40 adir/date

################################################################################
# Change the permissions on date to remove the executable permissions.
################################################################################
chmod -x adir/date

################################################################################
# check the permissions of the program date
################################################################################
ls -la adir/date
-rw-r--r-- 1 dinkel gibson 54916 Sep 17 13:40 adir/date

################################################################################
# Try running it as ./date or adir/date (depending on your current working directory)
################################################################################
adir/date
exercise_10.sh: 47: exercise_10.sh: adir/date: Permission denied

################################################################################
# Change the permissions back so that the file is executable.
################################################################################
chmod +x adir/date

################################################################################
# Try running it as ./date or adir/date (depending on your current working directory)
################################################################################
adir/date
Mon Sep 17 13:40:20 CEST 2012

################################################################################
# Copy a textfile from a previos exercise into adir, then change the permissions
# so you are not allowed to write to it.
# Then change the permissions so you can't read/cat it either.
################################################################################
cp ../../exercise_6/FYN_HUMAN.fasta adir/
ls -la adir/FYN_HUMAN.fasta
-rw-r--r-- 1 dinkel gibson 628 Sep 17 13:40 adir/FYN_HUMAN.fasta
chmod u-w adir/FYN_HUMAN.fasta
ls -la adir/FYN_HUMAN.fasta
-r--r--r-- 1 dinkel gibson 628 Sep 17 13:40 adir/FYN_HUMAN.fasta
chmod u-r adir/FYN_HUMAN.fasta
ls -la adir/FYN_HUMAN.fasta
----r--r-- 1 dinkel gibson 628 Sep 17 13:40 adir/FYN_HUMAN.fasta

################################################################################
# Change your working directory to testpermissions, and then try changing the permissions on adir.
# What are the minimum permissions (on the directory) necessary for you to be able to execute adir/date?
################################################################################

rm -rf testpermissions

cd -
