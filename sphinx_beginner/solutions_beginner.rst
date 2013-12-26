
Solutions to the Exercises
==========================

Misc. file tools
----------------

#. Which tool can be used to determine the type of a file? ::

    $ file

#. Use it on the following files/directories and compare the results:

   a) ``/usr/bin/tail`` ::

       $ file /usr/bin/tail
       /usr/bin/tail: binary executable

   b) ``~`` ::

       $ file ~
       /home/dinkel: directory

   c) ``/exercises/SRC_HUMAN.fasta`` ::

       $ file /exercises/SRC_HUMAN.fasta
       /exercises/SRC_HUMAN.fasta: ASCII text



Searching
---------
#. Which tool can be used to search for files or directories? ::

   $ find

#. Use it to find all directories in the ``/exercises`` directory ::

   $ find /exercises -type d

#. Search for the file date in the ``/bin`` directory ::

   $ find /bin -name date

#. List those entries in the directory ``/bin`` that are bigger than 400kBytes ::

   $ find /bin -size +400k


Misc. terminal
--------------
#. Which two tools can be used to redraw/empty the screen? ::

   $  clear


Permissions
-----------

#. Create a directory called testpermissions ::

   $ mkdir testpermissions

#. Change your working directory to testpermissions ::

   $ cd testpermissions

#. Create a directory called adir. ::

   $ mkdir adir

#. Use the command ``which date`` to find out where the date program is located. ::

    $ which date
    /bin/date

#. Copy this date program into the directory adir. ::

    $ cp /bin/date adir/

#. Check the permissions of the copied program date ::

    $ ls -lh adir/date
    -r-xr-xr-x  1 dinkel  staff    79K  9 Dec 13:47 date*

#. Change the permissions on date to remove the executable permissions. ::

    $ chmod a-x adir/date

#. Check the permissions of the program date ::
 
    $ ls -lh adir/date
    -r--r--r--  1 dinkel  staff    79K  9 Dec 13:47 date*

#. Try running it as ``./date`` or ``adir/date`` (depending on your current working directory) ::

    $ adir/date
    permission denied

#. Change the permissions back so that the file is executable. ::

   $ chmod a+x adir/date

#. Try running it as ``./date`` or ``adir/date`` (depending on your current working directory) ::

    $ adir/date
    Mon Dec  9 13:50:12 CET 2013

#. Copy a textfile from a previos exercise into adir, then change the permissions, so you are not allowed to write to it. ::

    $ cp /exercises/SRC_HUMAN.fasta adir
    $ chmod u-w adir/SRC_HUMAN.fasta

#. Then change the permissions so you can't read/cat it either. ::

   $ chmod u-r adir/SRC_HUMAN.fasta

#. Change your working directory to testpermissions, and then try changing the permissions on the directory adir to non-executable. ::

    $ # we don't need to change directory, because we still are in the directory testpermissions
    $ chmod a-x adir

#. What are the minimum permissions (on the directory) necessary for you to be able to execute ``adir/date``? ::

   $ chmod u+rx adir


Remote access
-------------
#. Login to machine "sub-master.embl.de" (using your own username) ::

   $ ssh sub-master.embl.de -l username

#. Use exit to quit the remote shell (Beware to not exit your local shell) ::

   $ exit

#. Use clear to empty the screen after logout from the remote server ::

   $ clear

#. Use the following commands locally as well as on the remote machine to get a feeling for the different machines: ::

    A) ``hostname``
 
    B) ``whoami``
 
    C) ``cat /etc/hostname``
 
    D) ``ls -la ~/``

#. Copy the file ``/etc/motd`` from machine sub-master.embl.de into your local home directory (using scp) ::

    $ scp sub-master.embl.de:/etc/motd ~/

#. Determine the filetype and the permissions of the file that you just copied ::

    $ file ~/motd
    ~/motd: ASCII text

   $ ls -l ~/motd

#. Login to your neighbor's machine (ask him for the hostname) using the username ``teach01`` (password will be given by your teacher) ::

    $ ssh teach01@hostname


IO and Redirections
-------------------
#. Use date in conjuction with the redirection to insert the current date into the (new) file current_date (in your homedirectory). ::

   $ date > ~/current_date

#. Inspect the file to make sure it contains (only a single line with) the date. ::

   $ cat ~/current_date

#. Use ``date`` again to append the current date into the same file. ::

   $ date >> ~/current_date

#. Again, check that this file now contains two lines with dates. ::

   $ cat ~/current_date

#. Use ``grep`` to filter out lines containing the term "TITLE" from all PDB files in the exercises directory and use redirection to insert them into a new file pdb_titles.txt. ::

   $ grep TITLE /exercises/*.pdb > pdb_titles.txt

#. (OPTIONAL) Upon inspection of the file pdb_titles.txt, you see that it also contains the names of the files in which the term was found. 

   A. Use either the grep manpage or ``grep --help`` to find out how you can suppress this behaviour.  ::

      $ grep -h TITLE /exercises/*.pdb > pdb_titles.txt

   B. Redo the previous exercise such that the output file pdb_titles.txt only contains lines starting with TITLE. ::

      $ grep -h "^TITLE" /exercises/*.pdb > pdb_titles.txt



