cd exercise_6

# cat (=catenate) the file SRC_HUMAN.fasta
cat SRC_HUMAN.fasta


# cat the file SRC_HUMAN.fasta
cat -n -A SRC_HUMAN.fasta



# just view the first x lines of the file  EPSINS.fasta
head  EPSINS.fasta


# just view the last x lines of the file  EPSINS.fasta
tail EPSINS.fasta


# view the first line of each fasta file in the current directory:
head -n1 *.fasta -q


# pause
sleep 2

# view the whole file EPSINS.fasta, but scroll pagewise
less EPSINS.fasta
 


cd -
