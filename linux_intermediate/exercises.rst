
Commandline Exercises
======================

TAR & GZIP
----------

1. Use :index:`gzip <gzip>` to compress the file P12931.txt

2. Decompress the resulting file P12931.txt.gz (revert previous command)

3. Use :index:`tar <tar>` to create an archive containing all fasta files in the current directory into an archive called "fastafiles.tar"

4. Use gzip to compress the archive "fastafiles.tar"

5. How can you achieve the two previous steps "using tar to create archive" and "gzip the archive" in one command? 

6. Test (list the contents of) the compressed archive "fastafiles.tar.gz"

7. Download the compressed PDB file for entry 1Y57 from rcsb.org (eg. ``wget "http://www.rcsb.org/pdb/files/1Y57.pdb.gz"``) and decompress it. 

 
GREP
----

1. Which of the DNA files ENST0* contains "TATATCTAA" as part of the sequence? 

2. List only the names of the DNA files ENST0* that contain "CAACAAA" as part of the sequence.

3. Considering the previous example, would you consider grep a suitable tool to perform motif searches? Why not? Try to find the pattern "CAACAAA" by manual inspection of the first three lines of each sequence.

4. Count the number of ATOMs in the file 1Y57.pdb. 

5. Does this number agree with the annotated number of atoms? The PDB file has a comment which tells you how many atoms there are annotated in this file. This comment can be found by searching for the term "protein atoms" (use quotes and case insensitive search here!).

REV
---

1. By combining ``rev`` with the ``cut`` tool, print the last word of each line in DNA.txt. Make sure that the words are readable when they are printed out.


XARGS
-----

1. Use ``xargs`` to print the first line of the files listed in to_be_previewed.txt

2. Create a copy of each of these files by passing the lines in to_be_copied.txt two-at-a-time to ``cp``

3. A better way to back up these files might be to keep the original names while copying them. Make another copy of each file listed in to_be_previewed.txt, adding ".backup" onto the end of each filename. (Hint: remember the "-I" option!)

4. ADVANCED: clean up all these new files by combining the ``find`` tool with ``xargs`` and ``rm`` to search for and delete all files in the current directory that were last modified less than ten minutes ago. BE CAREFUL! (Hint: you'll need to check out the options available for ``find``, and you might consider using the "-p" option with ``xargs`` to help avoid accidentally deleting something that you might regret!)


SED
---

1. Use sed to print only those lines that contain "version" in the files P05480.txt and P04062.txt

2. Use sed to change the text "sequence version 3" to "sequence version 4" in the files P05480.txt and P04062.txt (without actually changing the files, just printing) 

3. Use sed to update the text "sequence version 3" to "sequence version 4" in the files P05480.txt and P04062.txt (this time, make the changes directly in the files) 

4. Replace (transliterate) all occurrences of "r" by "l" and "l" by "r" (at the same time) in the file PROTEINS.txt (so that "structural" becomes "stluctular") 


AWK
---

1. Use awk to print only those lines that contain "version" in the files P12931.txt and P05480.txt and think about how this procedure is different to sed. 

2. For all FASTA files that begin with "P" ("P*.fasta") print only the second item of the header (split on "|") eg. for ">sp|P12931|SRC_HUMAN Proto-oncogene", print only "P12931"

3. The file "P12931.csv" contains phosphorylation sites in the protein P12931. (If the file "P12931.csv" does not exist, use ``wget http://phospho.elm.eu.org/byAccession/P12931.csv`` to download it ). 

   a. Column three of this file lists the amino acid position of the phosphorylation site. You are only interested in position 17 of the protein. Try to use "grep" to filter out all these lines containing "17". 
  
   b. Now use awk to show all lines containing "17".
  
   c. Next try to show only those lines where column three equals 17 (Hint: The file is semicolon-separated...).
  
   d. Finally print the PMIDs (column 6) of all lines that contain "17" in column 3. 


Quoting and Escaping
--------------------

1. Familiarize yourself with quoting and escaping.

 a. Run the following commands to see the difference between single and double quotes when expanding variables:
  ::

    $ echo "$HOSTNAME"
    ...
    $ echo '$HOSTNAME'

 b. Next, use ssh to login to a different machine to run the same command there, again using both quoting methods:

  ::

    $ ssh pc-atcteach01 'echo $HOSTNAME'
    ...
    $ ssh pc-atcteach01 "echo $HOSTNAME"

2. Closely inspect the results; is that what you were expecting? Discuss this with your neighbour.


