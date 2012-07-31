cd exercise_7

# print only those lines of the file EPSINS.txt, that contain the word "RecName"
grep "RecName" EPSINS.txt

# print only those lines of the file EPSINS.fasta that contain the character ">" (FASTA header)
grep ">" EPSINS.fasta

# print only those lines of the file EPSINS.fasta that DO NOT contain the character ">" (FASTA sequence)
grep -v ">" EPSINS.fasta






cd -
