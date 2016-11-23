
**********************
More Commandline Tools
**********************

Here is a quick list of useful commandline tools which will be used throughout the rest of the document.
Many of these tools have quite extensive functionality and only a very limited part can be discussed here, 
so the reader is encouraged to read more about these using the links given in the in the :doc:`links <links>` 
section...

Commandline Tools
==================



GZIP
----
:index:`gzip <gzip>` is a compression/decompression tool.
When used on a file (without any parameters) it will compress it and replace the
:index:`file <ls>` by a compressed version with the extension '.gz' attached:


 ::

  # ls textfile*
   textfile
  # gzip textfile
  # ls textfile*
   textfile.gz
 
To revert this / to uncompress, use the parameter ``-d``:

 ::

  # ls textfile*
   textfile.gz
  # gzip -d textfile
  # ls textfile*
   textfile
 
.. note:: As a convenience, on most Linux systems, a shellscript named ``gunzip`` exists which simply calls ``gzip -d``



TAR
----

:index:`tar <tar>` (tape archive) is a tool to handle archives. Initially it was created to combine
multiple files/directories to be written onto tape, it is now the standard tool to
collect files for distribution or archiving.

``tar`` stores the permissions of the files within an archive and also copies special files
(such as symlinks etc.), which makes it an ideal tool for archiving...
Usually tar is used in conjunction with a compression tool such as gzip to create a
compressed archive:

.. figure:: _static/targzip.png

    source: Th0msn80 (Wikipedia)

The most common commandline switches are:

=======  ===================================
Option:  Effect: 
=======  ===================================
-c       create an archive
-t       test an archive
-x       extract an archive
-z       use gzip compression
-f       filename filename of the archive
=======  ===================================

.. note:: Don't forget to specify the target filename. 
          It needs to follow the ``-f`` parameter. Although you can combine options like such: ``tar -czf archive.tar`` 
          the order matters, so ``tar -cfz archive.tar`` will *not* do what you want...



Creating an archive containing two files:

 ::

  # tar -cf archive.tar textfile1 textfile2

Listing the contents of an archive:

 ::

  # tar -tf archive.tar
   textfile1
   textfile2

Extracting an archive:

 ::

  # tar -xf archive.tar

Creating and extracting a compressed archive containing two files:

 ::

  # tar -czf archive.tar.gz textfile1 textfile2
  # tar -xzf archive.tar.gz


Creating a backup (eg. before doing something dangerous?): 

 ::

  # tar -czf /folder/containing/the/BACKUP.tgz /folder/you/want/to/backup


GREP
----

:index:`grep` finds lines matching a pattern in textfiles.

**Usage**: grep [options] pattern file(s)

 ::

  # grep -i ensembl P04637.txt

   DR Ensembl; ENST00000269305; ENSP00000269305; ENSG00000141510.
   DR Ensembl; ENST00000359597; ENSP00000352610; ENSG00000141510.
   DR Ensembl; ENST00000419024; ENSP00000402130; ENSG00000141510.
   DR Ensembl; ENST00000420246; ENSP00000391127; ENSG00000141510.
   DR Ensembl; ENST00000445888; ENSP00000391478; ENSG00000141510.
   DR Ensembl; ENST00000455263; ENSP00000398846; ENSG00000141510.


Useful options:

=======  ===================================
Option:  Effect: 
=======  ===================================
-v       Print lines that do not match
-i       Search case-insensitive
-l       List files with matching lines, not the lines itself
-L       List files without matches
-c       Print count of matching lines for each file
=======  ===================================

Count the number of fasta sequences (they start with a ">") in a file:

 ::

  # grep -c '>' twofiles.fasta
   2

List all files containing the term "Ensembl":

 ::

  # grep -l Ensembl *.txt
   P04062.txt
   P12931.txt

Search a file compressed with ``gzip`` using ``zgrep``:

 ::

  # zgrep -c '@M34567' IlluminaReads.fastq.gz
   34956188


REV
---

:index:`rev` is a tool that reverses lines of input.

*Usage*: `rev file`

`rev` can take input from STDIN as well as from a file, which can be useful if you need 
to reverse the output of a process.

You can combine `rev` with the `cut` tool, to capture the last columns in a file, without
first needing to know the total number of columns.

::

  # cat tabular_data.txt
   AAA    1    0.90
   BBB    2    0.75
   CCC    3    0.82
  # rev tabular_data.txt | cut -f1 | rev
   0.90
   0.75
   0.82

Note the double use of `rev` in the example above - the output of the `cut` command must
be reversed to restore the original orientation of the input file.


FMT
---

:index:`fmt` is used to control the format of text input.

*Usage*: `fmt [options] file(s)`

By using `fmt` you can control the width and alignment of lines of text, while maintaining
the larger structural elements such as paragraph breaks and indentation.

The most powerful use case when working with files containing data, is to convert a vector
of values into a single column:

::

  # echo "sample1 sample2 sample3 sample4 sample5" | fmt 1
   sample1
   sample2
   sample3
   sample4
   sample5


XARGS
-----

:index:`xargs` can be used to provide file contents or output of one command as arguments
to the next.

*Usage*: `xargs [options] [ tool [options] [arguments] ]`

By default, `xargs` passes the strings given to it onto the `echo` command.

::

  # cat motifs.txt
   KPLGVALTNRFGEDADERID
   RPIGPEIQNRFGENAEERIP
   RSVATQVFNRFGDDTESKLP
   RAIGAELQNRFSNDAEQRIP

  # cat motifs.txt | xargs
   KPLGVALTNRFGEDADERID RPIGPEIQNRFGENAEERIP RSVATQVFNRFGDDTESKLP RAIGAELQNRFSNDAEQRIP

In this way we can achieve the reverse of the row vector -> column operation performed in
the `fmt` example above. But `xargs` can be used for much more powerful things than only
`echo`ing command output. By providing an argument to `xargs` we can specify the 
tool/command that we want `xargs` to pass the strings to as arguments.

::

  # cat files.txt
   DNA.fasta
   DNA.txt
   EMBL_wikipedia.txt

  # cat files.txt | xargs head -n2
   ==> DNA.fasta <==
   GGGCTTGTGGCGCGAGCTTCTGAAACTAGGCGGCAGAGGCGGAGCCGCTGTGGCACTGCT
   GCGCCTCTGCTGCGCCTCGGGTGTCTTTTGCGGCGGTGGGTCGCCGCCGGGAGAAGCGTG
   
   ==> DNA.txt <==
   Deoxyribonucleic acid (DNA) molecules are informational molecules encoding the
   genetic instructions used in the development and functioning of all known
   
   ==> EMBL_wikipedia.txt <==
   EMBL
   

One of the most common uses of `xargs` is in combination with the `find` command, allowing
the user to operate on multiple files across multiple locations at once. For example, to
search for the word 'protein' in all `.txt` files underneath the 'Documents' directory, we
could use the approach below:

::

  # find ~/Documents -name '*.txt' | xargs grep 'protein'
   DNA.txt:living organisms and many viruses. Along with RNA ...
   DNA.txt:within proteins. The code is read by copying stret...
   DNA.txt:chromatin proteins such as histones compact and or...
   DNA.txt:structures guide the interactions between DNA and ...
   P04062.txt:RT   "Identification and quantification of N-li...
   ...

Similarly, we can use `xargs` and `find` to quickly delete multiple files spread
throughout the filesystem.


::

  # find /tmp -name '*.tmp' | xargs rm

The command above will find any files with '.tmp' extension and pass them to `rm` for
deletion. Of course, care should always be taken when using commands that alter the
filesystem, such as `rm` and `mv`, so you need to be sure that you know what's going to
happen before you execute a command like the one above. Helpfully, `xargs` provides an
option `-p` that will prompt the user before executing commands.


::

  # find / -size +5GB | xargs -p rm
   rm /home/toby/alignments/giant_alignment.bam? y

This is a good way of sweeping your filesystem to find the largest files and then choosing
whether to remove them. You could employ a similar approach with `xargs` to compress
these large files. 

If you need to control where exactly the strings passed to `xargs` are placed in the 
command that it subsequently calls, use the -I option:

::

  # find /home/toby/alignments -name "*.fasta" | xargs -I OLDFASTA mv OLDFASTA OLDAFASTA.old

Useful options:

=======  ===================================
Option:  Effect: 
=======  ===================================
-n INT   pass INT strings as arguments to each invocation of tool
-0       use NULL as separator (good for handling strings/filenames containing spaces)
-t       echo commands to STDERR as they are executed
=======  ===================================

SED
---

:index:`sed` is a Stream EDitor, it modifies text (text can be a file or a pipe) on the fly.

*Usage*: '``sed command file``',

The most common usecases are:

===========================================  =====================
Usecase                                      Command:
===========================================  =====================
Substitute TEXT by REPLACEMENT:              's/TEXT/REPLACEMENT/'
Transliterate the characters x a, and y b:   'y/xy/ab/'
Print lines containing PATTERN:              '/PATTERN/p'
Delete lines containing PATTERN:             '/PATTERN/d'
===========================================  =====================



 ::

  # echo "This is text." | sed 's/text/replaced stuff/'
   This is replaced stuff.

By default, text substitution are performed only once per line. You need to add a
trailing 'g' option, to make the substitution 'global' ('s/TEXT/REPLACEMENT/g'),
meaning all occurrences in a line are substituted (not just the first in each line).
Note the difference:

 ::

  # echo "ACCAAGCATTGGAGGAATATCGTAGGTAAA" | sed 's/A/_/'
   _CCAAGCATTGGAGGAATATCGTAGGTAAA

  # echo "ACCAAGCATTGGAGGAATATCGTAGGTAAA" | sed 's/A/_/g'
   _CC__GC_TTGG_GG__T_TCGT_GGT___
 
You can use transliteration to replace all instances of a character with another character.
For example, to switch Thymidines to Uridines in a sequence:

 ::

  # echo "AGTGGCTAAGTCCCTTTAATCAGG" | sed 'y/T/U/'
   AGUGGCUAAGTCCCUUUAAUCAGG

In the pattern specified in the ``sed`` command, each character in the first set is replaced 
with the character in the equivalent position in the second set. For example,  to get the 
reverse transcript of a DNA sequence:

 ::

  # echo "AGTGGCTAAGTCCCTTTAATCAGG" | sed 'y/ACGT/UGCA/'
   UCACCGAUUCAGGGAAAUUAGUCC

This is the complementary sequence, but we wanted the reverse complement, so we need to use
the Linux command ``rev`` to reverse the output of the ``sed`` command:

 ::

  # echo "AGTGGCTAAGTCCCTTTAATCAGG" | sed 'y/ACGT/UGCA/' | rev
   CCUGAUUAAAGGGACUUAGCCACU

When used on a file, sed prints the file to standard output, replacing text as it goes
along:

 ::

  # echo "This is text" > textfile
  # echo "This is even more text" >> textfile
  # sed 's/text/stuff/' textfile
   This is stuff
   This is even more stuff

sed can also be used to print certain lines (not replacing text) that match a pattern.
For this you leave out the leading 's' and just provide a pattern: '/PATTERN/p'. The
trailing letter determines, what sed should do with the text that matches the pattern
('p': print, 'd': delete)

 ::

  # sed '/more/p' textfile
   This is text
   This is even more text
   This is even more text

As sed by default prints each line, you see the line that matched the pattern,
printed twice. Use option '-n' to suppress default printing of lines.

 ::

  # sed -n '/more/p' textfile
   This is even more text

Delete lines matching the pattern:

 ::

  # sed '/more/d' textfile
   This is text

Multiple sed statements can be applied to the same input stream by prepending
each by option '-e' (edit):

 ::

  # sed -e 's/text/good stuff/' -e 's/This/That/' textfile
   That is good stuff
   That is even more good stuff

Normally, sed prints the text from a file to standard output. But you can also edit
files in place. Be careful - this will change the file! The '-i' (in-place editing) won't
print the output. As a safety measure, this option will ask for an extension that will
be used to rename the original file to. For instance, the following option '-i.bak'
will edit the file and rename the original file to textfile.bak:

 ::

  # sed -i.bak 's/text/stuff/' textfile
  # cat textfile
   This is stuff
   This is even more stuff
  # cat textfile.bak
   This is text
   This is even more text


AWK
---

:index:`awk` is more than just a command, it is a complete text processing language (the
name is an abbreviation of the author's names).
Each line of the input (file or pipe) is treated as a record and is broken into fields.
Generally, awk commands are of the form: ::

    awk condition { action }

where:

- condition is typically an expression
- action is a series of commands

If no condition is given, the action is applied to each line, otherwise just to the
lines that match the condition.

 ::

  # awk '{print}' textfile
   This is text
   This is even more text

  # awk '/more/ {print}' textfile
   This is even more text

awk reads each line of input and automatically splits the line into columns. These
columns can be addressed via $1, $2 and so on ($0 represents the whole line).
So an easy way to print or rearrange columns of text is:

 ::

  # echo "Bob likes Sue" | awk '{print $3, $2, $1}'
   Sue likes Bob

  # echo "Master Obi-Wan has lost a planet" | awk '{print $4,$5,$6,$1,$2,$3}'
   lost a planet Master Obi-Wan has

awk splits text by default on whitespace (spaces or tabs), which might not be ideal in all situations. To change the
field separator (FS), use option '-F' (remember to quote the field separator):

 ::

  # echo "field1,field2,field2" | awk -F',' '{print $2, $1}'
   field2 field1

Note two things here: First, the field separator is not printed, and second, if you
want to have space between the output fields, you actually need to separate them
by a comma or they will be concatenated together...

 ::

  # echo "field1,field2,field2" | awk -F',' '{print $1 $2 $3}'
   field1field2field3

You can also combine the pattern matching and the column selection techniques,
in this example we'll print only the third column of the lines matching the
pattern 'PDBsum' (case sensitive): 

 ::

  $ awk '/PDBsum/ {print $3}' P12931.txt
  1A07;
  1A08;
  1A09;
  1A1A;
  ...  


awk really is powerful in filtering out columns, you can for instance print only
certain columns of certain lines. Here we print the third column of those lines
where the second column is 'PDBsum':

 ::

  # awk '$2=="PDBsum;" {print $3}' P12931.txt
  1A07;
  1A08;
  1A09;
  1A1A;
  ...  


Note the double equal signs "==" to check for equality and note the quotes around
"PDBsum;".
If you want to match a field, but not exactly, you can use '~' instead of '==':

 ::

  # awk '$4~"sum" {print $3}' P12931.txt
  1A07;
  1A08;
  1A09;
  1A1A;
  ...  


..
.. Sum column 1 of file.txt:
.. 
.. awk '{sum+=$1} END {print sum}' file.txt


I/O Redirection
===============

Three IO "channels" are available by default:

- **Standard input (STDIN, Number: 0)**: The input for your program, normally your keyboard but can be an other program (when using pipes or IO redirection)
- **Standard output (STDOUT, Number: 1)**: Where your program writes its regular output to. Normally your terminal
- **Standard error (STDERR, Number: 2)**: Where your programs normally write their error message to. Normally your terminal

Input, output and error messages can be redirected from their default "targets" to others.  If using the file descriptor numbers (0, 1, 2) in redirections, then
there must be no whitespace between the numbers and the redirection operators.

.. hint:: Redirect to ``/dev/null`` to discard the output of any command

Write the output of *cmd* into *afile*.  This will **overwrite** *afile*::

  $ cmd > afile

Write the output of *cmd* into *afile*.  This will **append** to *afile*::

  $ cmd >> afile

Discard the output of *cmd* ::

  $ cmd > /dev/null

Write the output of *cmd* into *afile* (overwriting *afile*!) and write STDERR to the same place::

  $ cmd > afile 2>&1

Append the output and error messages of *cmd* to *afile*::

  $ cmd >> afile 2>&1

Same as above::

  $ cmd > afile 2> afile

Append the output of *cmd* to *afile* and discard error messages::

  $ cmd >> afile 2>/dev/null

Three times the same: Discard output and error messages completely::

  $ cmd > /dev/null 2>&1
  $ cmd > /dev/null 2>/dev/null
  $ cmd >& /dev/null

Use output of *cmd2* as standard input for *cmd1*::

  $ cmd1 < cmd2


See also 

- `Bash One-Liners Explained, Part III: All about redirections <http://www.catonmat.net/blog/bash-one-liners-explained-part-three>`_ [#L1]_
- `Bash Redirections Cheat Sheet <http://www.catonmat.net/blog/bash-redirections-cheat-sheet>`_ [#L2]_
- `Redirection Tutorial <http://wiki.bash-hackers.org/howto/redirection_tutorial>`_ [#L3]_


  .. [#L1] `http://www.catonmat.net/blog/bash-one-liners-explained-part-three <http://www.catonmat.net/blog/bash-one-liners-explained-part-three>`_ 
  .. [#L2] `http://www.catonmat.net/blog/bash-redirections-cheat-sheet <http://www.catonmat.net/blog/bash-redirections-cheat-sheet>`_ 
  .. [#L3] `http://wiki.bash-hackers.org/howto/redirection_tutorial <http://wiki.bash-hackers.org/howto/redirection_tutorial>`_ 


.. _environment_variables:

Variables
=========

The shell knows two types of variables: “Local” `shell` :index:`variables <variables; shell
variables>` and “global” exported `environment` :index:`variables <variables; environment
variables>`. By convention, environment variables are written in uppercase
letters.

**Shell variables** are **only available to the current shell** and not inherited when
you start an other shell or script from the commandline. Consequently, these
variables will not be available for your shellscripts.

**Environment variables** are **passed on** to shells and scripts started from your
current shell.


Setting, Exporting and Removing Variables 
------------------------------------------

Variables are set (created) by simply assigning them a value

::

  $ MYVAR=something
  $

.. note:: There must be no whitespace surrounding the equal sign!

To create an environment
variable, ``export`` is used. You can either export while assigning a value or in a
separate step. Both of the following procedures are equivalent:

a)

 ::

  $ export MYGLOBALVAR=”something else”
  $

b)

 ::

  $ MYGLOBALVAR=”something else” 
  $ export MYGLOBALVAR
  $

.. note:: There is no ``$`` in front of the variable: To reference the variable itself (not its content) the name is used without ``$``

Variables are removed with ``unset``:

::

  $ unset MYVAR
  $

.. note:: Assigning a variable an empty value (i.e. ``MYVAR=``) will *not* remove it but simply set
          its value to the empty string! 

Listing Variables 
------------------

You can list all your current
environment variables :index:`with <env>` ``env`` and all shell variables :index:`with <set>` ``set``. The list of
shell variables will also contain all environment variables  ::

  $ set | more
  BASH=/bin/bash
  BASH_ARGC=()
  BASH_VERSION='4.1.2(1)-release'
  COLORS=/etc/DIR_COLORS.256color
  COLUMNS=181
  ...
  $


Variable Inheritance 
---------------------

Only environment variables will be available in shells and scripts
started from your current shell. However in shell commands run in subshells
(i.e. commands run within round brackets) also local (shell) variables of your
current shell are available. 

Examples 
^^^^^^^^

Consider the following small shellscript `vartest.sh`::

  #!/bin/sh 
  echo $MYLOCALVAR
  echo $MYGLOBALVAR
  echo -----

We will use it in the following examples to illustrate the various variable inheritances:

a) Set the variables and run the script i.e. in a new shell:

 ::

  $ export MYGLOBALVAR=”I am global” 
  $ MYLOCALVAR=”I am local” 
  $ ./vartest.sh
  I am global 
  -----
  $

b) “source” the script, i.e. run it within your current shell:

 ::
 
  $ source ./vartest.sh 
  I am local 
  I am global 
  -----
  $

c) Access the variables in a subshell:

 ::
 
  $ (echo $MYGLOBALVAR; echo $MYLOCALVAR) 
  I am global 
  I am local 
  $


Tips and Tricks
===============

Quoting
-------

In Programming it is often necessary to "glue together" certain words. Usually, a program or
the shell splits sentences by whitespace (space or tabulators) and treats each word
individually. In order to tell the computer that certain words belong together, you need to
":index:`quote <quoting>`" them, using either single (') or double (") quotes. The difference between these two is
generally that within double quotes, variables will be expanded, while everything within
single quotes is treated as string literal.
When setting a variable, it doesn't matter which quotes you use:


 ::

  # MYVAR=This is set
   -bash: is: command not found

  # MYVAR='This is set'
  # echo $MYVAR
   This is set
  # MYVAR="This is set"
  # echo $MYVAR
   This is set

However, it does matter, when using (expanding) the variable:
Double quotes:

 ::

  # export MYVAR=123
  # echo "the variable is $MYVAR"
   the variable is 123
  # echo "the variable is set" | sed "s/set/$MYVAR/"
   the variable is 123

Single quotes:

 ::

  # export MYVAR=123
  # echo 'the variable is $MYVAR'
   the variable is $MYVAR
  # echo "the variable is set" | sed 's/set/$MYVAR/'
   the variable is $MYVAR

Weird things can happen when parsing data/text that contains quote characters:

 ::

  # MYVAR='Don't worry. It's ok.'; echo $MYVAR
   >
  # you need to press Ctrl-C to abort
  # MYVAR="Don't worry. It's ok."; echo $MYVAR
   Don't worry. It's ok.


Expanding and Escaping
^^^^^^^^^^^^^^^^^^^^^^

You already learned how to expand a variable such that its value is used instead of its name:

 ::

  # export MYVAR=123
  # echo "the variable is $MYVAR"
   the variable is 123

":index:`Escaping <escape>`" a variable is the opposite, ensuring that the literal variable name is used instead of its value:

 ::

  # export MYVAR=123

  # echo "the \$MYVAR variable is $MYVAR"
   the $MYVAR variable is 123

.. note:: The "escape character" is usually the backslash "``\``".

.. .. include:: exercises.rst


Keyboard Shortcuts
------------------

When getting comfortable with working on the command line, it can be helpful to learn 
some tricks that can save you time, better manage your session, and help you to avoid 
annoying errors due to typos.

Tab-Completion: A Reminder
^^^^^^^^^^^^^^^^^^^^^^^^^^

You're probably already aware of tab-completion, where you push the ``tab`` key to 
complete the name of a command, file, directory, etc. This is a huge time-saver and great 
tool for preventing the accidental inclusion of errors. 

Move Quickly Through the Command Line
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As well as tab-completion, you might be aware of ``CTRL-A`` to jump the cursor to the 
beginning of a line, and ``CTRL+E`` to jump to the end. On most systems, using the arrow 
keys while holding down the ``alt`` key will jump left or right by one word (or word-like 
string) at a time.

When editing a line, ``CTRL-W`` can be used to delete left from the current cursor 
position to the next beginning of a word. ``CTRL+U`` will delete left from the current 
cursor position to the beginning of the line.

Searchable Command History
^^^^^^^^^^^^^^^^^^^^^^^^^^

You're probably aware of the command history, and that you can use the up and down arrow 
keys to scroll back and forth throughout that history. You can also use ``CTRL+R`` to 
search that command history. If you type ``CTRL+R`` and then the beginning of a command, 
you will see the most recent command in the history that matches that pattern (anywhere 
in the command). You can hit ``CTRL+R`` again to scroll backwards through the matches.

Job Management
^^^^^^^^^^^^^^

Use ``CTRL+C`` to abort the current process, and ``CTRL+D`` to close the current shell.

If you don't want to abort, you might instead want to use ``CTRL+Z`` to suspend the
current process. You can resume the most recently-suspended job with
:index:`fg <fg>`, to run it in the 'foreground' of the shell, or
:index:`bg <bg>` to run it in the 'background'. In the shell, a command running
in the foreground is a job that will prevent the user from executing further commands
until the job has finished. A job running in the background will continue to run while
the user can carry on using the shell prompt to execute other commands. On a related
note: to put a job in the background when you execute it, just add :index:`"&" <&>`
to the end of the command.

If you have multiple jobs running/suspended at one time, you can view a list of these
processes and their current status with :index:`jobs <jobs>`:

 ::

  # sleep 250 &
  [1] 19697
  # sleep 100
  ^Z
  [1]+  Stopped                 sleep 100
  # jobs
  [1]+  Stopped                 sleep 100
  [2]-  Running                 sleep 250 &

As mentioned before, you can restart the most recently-suspended job with ``fg`` or
``bg``. To restart another job in the list, you can refer to it with ``%1`` for job
number ``1`` in the list (``sleep 100`` in the example above), ``%2`` for job ``2``, and
so on. If, instead of restarting a job, you want to kill a suspended process, you can
use the :index:`kill <kill>` command and specify the job afterwards:

 ::

  # jobs
  [1]+  Stopped                 sleep 100
  [2]-  Running                 sleep 250 &
  # kill %2
  [2]-  Terminated: 15          sleep 250

The ``jobs`` list contains details of all running or stopped tasks that were initiated
within the current session. If you try to leave a session with ``exit`` while you still
have a job running or suspended, you will receive a warning message. (Note that this is
one of the rare occasions where the command line interface will ask you if you're sure
before doing something that could be potentially bad for you.) Use ``exit`` a second time
and the session will end, killing any remaining jobs as it does so.
