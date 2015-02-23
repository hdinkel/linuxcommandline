
Solutions to the Exercises
==========================

Misc. file tools
----------------

#. Which tool can be used to determine the type of a :index:`file`? ::

    $ file

#. Use it on the following files/directories and compare the results:

   a) ``/usr/bin/tail`` ::

       $ file /usr/bin/tail
       /usr/bin/tail: binary executable

   b) ``~`` ::

       $ file ~
       /home/dinkel: directory

   c) ``~/exercises/SRC_HUMAN.fasta`` ::

       $ file ~/exercises/SRC_HUMAN.fasta
       ~/exercises/SRC_HUMAN.fasta: ASCII text



Searching
---------
#. :index:`Which <find>` tool can be used to search for files or directories? ::

   $ find

#. Use it to find all directories in the ``~/exercises`` directory ::

   $ find ~/exercises -type d

#. Search for the file date in the ``/bin`` directory ::

   $ find /bin -name date

#. List those entries in the directory ``/bin`` that are bigger than 400kBytes ::

   $ find /bin -size +400k


Misc. terminal
--------------
#. :index:`Which <clear>` :index:`two <reset>` tools can be used to redraw/empty the screen? ::

   $  clear

 or::

   $  reset


Permissions
-----------

#. :index:`Create <mkdir>` a directory called testpermissions ::

   $ mkdir testpermissions

#. :index:`Change <cd>` your working directory to testpermissions::

   $ cd testpermissions

#. Create a directory called adir. ::

   $ mkdir adir

#. Use the  :index:`command <which>` ``which date`` to find out where the date program is located.::

    $ which date
    /bin/date

#.  :index:`Copy <cp>` this date program into the directory adir and name it 'mydate'.::

    $ cp /bin/date adir/mydate

#. :index:`Check <ls>` the permissions of the copied program 'mydate' ::
 
    $ ls -lh adir/mydate
    -r-xr-xr-x  1 dinkel  staff    79K  9 Dec 13:47 mydate*

#.  :index:`Change <chmod>` the permissions on 'mydate' to remove the executable permissions.::

    $ chmod a-x adir/mydate

#. Check the permissions of the program 'mydate' ::
 
    $ ls -lh adir/mydate
    -r--r--r--  1 dinkel  staff    79K  9 Dec 13:47 mydate*

#. Try running it as ``./mydate`` or ``adir/mydate`` (depending on your current working directory) ::

    $ adir/mydate
    permission denied

#. Change the permissions back so that the file is executable. ::

   $ chmod a+x adir/mydate

#. Try running it as ``./mydate`` or ``adir/mydate`` (depending on your current working directory) ::

    $ adir/mydate
    Mon Dec  9 13:50:12 CET 2013

#. Copy a textfile from a previos exercise into adir, then change the permissions, so you are not allowed to write to it. Test this by trying to read it via `cat`. ::

    $ cp ~/exercises/SRC_HUMAN.fasta adir
    $ chmod u-w adir/SRC_HUMAN.fasta

#. Then change the permissions so you can't read/cat it either. Test this by trying to read it via `cat`. ::

   $ chmod u-r adir/SRC_HUMAN.fasta

#. Change your working directory to testpermissions, and then try changing the permissions on the directory adir to non-executable. ::

    $ # no need to change directory, 
    $ # as we still are in the directory testpermissions
    $ chmod a-x adir

#. What are the minimum permissions (on the directory) necessary for you to be able to execute ``adir/mydate``? ::

   $ chmod u+rx adir


Remote access
-------------
#. :index:`Login <ssh>` to machine "sub-master.embl.de" (using your own username) ::

   $ ssh sub-master.embl.de -l username

#. Use :index:`exit` to quit the remote shell (Beware to not exit your local shell) ::

   $ exit

#. Use :index:`clear` to empty the screen after logout from the remote server::

   $ clear

#. Use the following :index:`commands <hostname,whoami,ls>` locally as well as on the remote machine to get a feeling for the different machines: ::
   

    A) ``hostname``
 
    B) ``whoami``
 
    C) ``ls -la ~/``

#.  :index:`Copy <scp>` the file ``/etc/motd`` from machine sub-master.embl.de into your local home directory (using scp)::

    $ scp sub-master.embl.de:/etc/motd ~/

#. Determine the  :index:`filetype <file>` and the permissions of the file that you just copied::

    $ file ~/motd
    ~/motd: ASCII text

   $ ls -l ~/motd

#.  :index:`Login <ssh>` to your neighbor's machine (ask him for the hostname) using your own username::

    $ ssh hostname


IO and Redirections
-------------------
#. Use :index:`date` in conjunction with the redirection to insert the current date into the (new) file current_date (in your homedirectory).::

   $ date > ~/current_date

#.  :index:`Inspect <cat>` the file to make sure it contains (only a single line with) the date. ::

   $ cat ~/current_date

#. Use ``date`` again to append the current date into the same file. ::

   $ date >> ~/current_date

#. Again, check that this file now contains two lines with dates. ::

   $ cat ~/current_date

#. :index:`Use <grep>` ``grep`` to filter out lines containing the term "TITLE" from all PDB files in the exercises directory and use redirection to insert them into a new file pdb_titles.txt.::

   $ grep TITLE ~/exercises/*.pdb > pdb_titles.txt

#. (OPTIONAL) Upon inspection of the file pdb_titles.txt, you see that it also contains the names of the files in which the term was found. 

   A. Use either the grep manpage or ``grep --help`` to find out how you can suppress this behaviour.  ::

      $ grep -h TITLE ~/exercises/*.pdb > pdb_titles.txt

   B. Redo the previous exercise such that the output file pdb_titles.txt only contains lines starting with TITLE. ::

      $ grep -h "^TITLE" ~/exercises/*.pdb > pdb_titles.txt

#. The *third* column of the file /etc/passwd contains user IDs (numbers)

   A. :index:`Use <cut>` ``cut`` to extract just the third column of this file (remember to specify the delimiter ':')::

      $ cut -f3 -d':' /etc/passwd 

   B. Next, use the :ref:`pipe <pipe>` symbol (`|`) and `sort` to sort this output *numerically*::

      $ cut -f3 -d':' /etc/passwd | sort -n


Bioinformatics
--------------

Let's do some bioinformatics analyis!
You can find the famous BLAST tool installed at `/g/software/bin/blastp`.

#. Typing the full path is too cumbersome, so let's append `/g/software/bin` to your $PATH variable and ensure that it works by calling `blastp`. ::

   $ export PATH=$PATH:/g/software/bin
   $ blastp

#. When you run `blastp  -help`, you notice that it has a lot of options! 
   Use redirections in conjunction with grep to find out which options you need to specify a *input_file* and *database_name*. ::

    $ blastp -help | grep input_file
    [-subject subject_input_file] [-subject_loc range] [-query input_file]

    $ blastp -help | grep database_name
    search_strategy filename] [-task task_name] [-db database_name]

#. Now run blastp using the following values as options: 

   *database_name* = `/g/data/ncbi-blast/db/swissprot` 

   *input_file* = `suspect1.fasta` 
   
   ::

    $ blastp -db /g/data/ncbi-blast/db/swissprot -query suspect1 fasta
