#####################################
Introduction to the Linux Commandline
#####################################

***********************
Why Use the Commandline
***********************

- It's **fast**. Productivity is a word that gets tossed around a lot by so-called power users, but the command line can
  really streamline your computer use, assuming you learn to use it right.

- It's **easier to get help**. The command line may not be the easiest thing to use, but it makes life a whole lot
  easier for people trying to help you and for yourself when looking for help, especially over the internet. Many times
  it's as simple as the helper posting a few commands and some instructions and the recipient copying and pasting those
  commands. Anyone who has spent hours listening to someone from tech support say something like, "OK, now click this,
  then this, then select this menu command" knows how frustrating the GUI alternative can be. 

- It's nearly **universal**. There are hundreds of Linux distros out there, each with a slightly different graphical
  environment. Thankfully, the various distros do have one common element: the command line. There are distro-specific
  commands, but the bulk of commands will work on any Linux system.

- It's **powerful**. The companies behind those other operating systems try their best to stop a user from accidentally
  screwing up their computer. Doing this involves hiding a lot of the components and tools that could harm a computer
  away from novices. Linux is more of an open book, which is due in part to its prominent use of the command line.

- Many 'modern' bioinformatics tools (samtools, bamtools, ...) are written for the commandline in order to be run on
  clusters and to be incorporated in scripts.

**************************************************
General Remarks Regarding Using UNIX/Linux Systems
**************************************************

- **Test before run**. Anything written here has to be taken with a grain of salt. On another system - be it a different
  Linux distribution or another UNIXoid operating system - you might find the same command but without the support of
  some of the options tought here. It is even possible, that the same option has a different meaning on another system.
  With this in mind always make sure to test your commands (specially the "dangerous" ones which remove or modify files)
  when switching from one system to the other.

- **The Linux/UNIX environment**. The behaviour of many commands is influenced or controlled by the so-called
  "environment". This environment is the sum of all your environment variables. Some of these environment variables will
  be shown towards the end of this course.

- **UPPERCASE, lowercase**. Don't forget that everything is case-sensitive.

- **The Filesystem**. Linux filesystems start on top at the root directory (sic!) "/" which hierarchically broadens
  towards the ground.  The separator between directories or directories and files in Linux is the slash ("/").


.. _figure-filesystem:
.. figure:: _static/filesystem.png

  Depending on the Linux distribution you might or might not find all of above
  directories. Most important directories for you are ``/bin`` and ``/usr/bin``
  (sometimes also ``/usr/local/bin``) which contain the user software, ``/home`` which
  usually contains the users' homedirectories and ``/tmp`` which can be used to store
  temporary data (beware: Its content is regularly removed!).

.. note:: The terms "directory" and "folder" are used interchangeably in this document.

Absolute Paths / Relative Paths
===============================

A path describes the the location of a file/folder in the filesystem: 
It is important to understand that there are basically two ways to describe such a path: Either by using an *absolute* pathname, or by using a
*relative* pathname. The difference is that *absolute* paths always start with a "slash ``/``". This "slash" denotes the so called "root" of the
filesystem (see below). *Relative* paths in contrast always starting with a directory name and denote the location of a file/folder *relative* to
the current directory.

.. note:: When in doubt, it's best to use *absolute* filenames. Commands given with absolute pathname are more easily repeated later, as they can
   be run independent of the current working directory (unlike relative paths).

***********************************
General Structure of Linux Commands
***********************************

:index:`Many <command; general structure>` linux commands have options and accept arguments. Options are a set of switch-like parameters
while arguments are usually free text input (such as a filename).

.. figure:: _static/LinuxCommandStructure.png

  General structure of Linux commands.

For example, in the commandline ``ls -l /usr/bin``, ``ls`` is the command, ``-l`` is an option and ``/usr/bin`` qualifies as an argument.

:index:`Commandline options <command, options, command; switches>` (sometimes called comandline switches) commonly have one of the two following
forms: The short form ``-s`` (just a single character) or the long form ``--string.`` E.g.

 :: 

  $ man -h
  $ man --help

Short options are usually - though not always - concatenable:

 ::

  $ ls -l -A -h
  $ ls -lAh

Some options require an additional argument, which is added with a blank to the short form and with an equal sign to the long form:

 :: 

  $ ls -I "*.pdf"
  $ ls --ignore="*.pdf"

Since Linux incorporates commands from different sources, options can be available in one or both forms and you'll also encounter options with no dash at all and all kinds of mixtures:

 :: 

  $ tar cf file.tar -C .. file/
  $ ps auxgww





******************************
A Journey Through the Commands
******************************

Please note that all examples and usage instructions below are just a glimpse of what you can do and reflect our opinion on what's important and what's not. Most of these commands support many more options and different usages. Consult the manpages to find them.

Typographical conventions: Commands and examples are written in Courier.  User Input is written in Courier bold and placeholders are generally written in italic.

Useful Terminal Tools & Keyboard Shortcuts
==========================================

Navigating previous commands
-----------------------------

You can use the ↑/↓ (up/down) arrow keys to navigate previously entered command and the ←/→ (left/right) keys to modify it before re-executing it.

Copying / Pasting using the mouse
---------------------------------

On most Linux systems you can use the mouse to select text and then press the middle mouse button to
paste that text at the position where your cursor is. This is especially useful for long directory
or filenames.


Printing some text
------------------

To simply print some text in the console, :index:`use <echo>` ``echo``:

**Usage**:  ``echo``

 :: 

  $ echo "this is some text"
  this is some text
  $

It can also be used to print the content of a variable, see section :ref:`environment_variables`...


:index:`Interrupting commands <command; interrupt>`
---------------------------------------------------

Whenever a program gets stuck or takes too long to finish, you can *interrupt* it with the shortcut
:kbd:`CONTROL-C`.

Leave the shell
---------------

To :index:`exit` the shell/terminal, just type ``exit`` or press :kbd:`CONTROL-D`.

:index:`clear` - Clear the "screen"
-----------------------------------

**Usage**:  ``clear``

 :: 

  $ clear
  $

In case the output of the terminal/screen gets cluttered, you can use ``clear`` to redraw the screen... 

 :: 

  $ cat /bin/echo
  $ ...(garbled output here)
  $ clear
  $

.. note:: If this doesn't work, you can use ``reset`` to perform a re-initialization of the terminal:

:index:`reset` - Reset your terminal
------------------------------------

**Usage**:  ``reset [options]``

 :: 

  $ reset
  $



.. _help:

Getting Help
============

``-h/--help`` option, no parameters
-----------------------------------

Many commands support a "help" option, either through ``-h`` or through ``--help``. 
Other commands will show a help page or at least a short usage overview if you provide incorrect commandline options

:index:`man` - show the manual page of a command
------------------------------------------------

**Usage**: 
``man command or file``

 :: 

  $ man man
  man(1)
  
  NAME
   man - format and display the on-line manual pages
  
  SYNOPSIS
   man [-acdfFhkKtwW] [--path] [-m system] [-p string] [-C config_file]
  ...
  $

For the navigation within a manpage see the :ref:`paragraph regarding less <less>`.

.. note:: The behaviour of ``man`` is dependent of the ``$PAGER`` environment variable

:index:`apropos` - list manpages containing a keyword in their description
--------------------------------------------------------------------------

**Usage**: ``apropos keyword``

 :: 

  $ apropos who
  ...
  who                  (1)  - show who is logged on
  who                  (1)  - display who is on the system
  whoami               (1)  - print effective userid
  $

Use ``apropos`` to find candidates for specific tasks


/usr/share/doc/
---------------

The ``/usr/share/doc/`` directory in some Linux distributions contains additional documentation of installed software packages 

Who am I, where am I
====================

:index:`whoami` - Print your username
-------------------------------------

Linux is a multi-User Operating System supporting thousands of users on the same machine. As usernames can differ between machines, it's important to know your username on any particular machine.

**Usage**: ``whoami``

 :: 

  $ whoami
  fthommen
  $

:index:`hostname` - Print the name of the computer
--------------------------------------------------

Each machine on the network has a unique name which is used to distinguish one from another.

**Usage**: ``hostname``

 :: 

  $ hostname
  pc-teach01
  $

:index:`pwd` - Print the current working directory
--------------------------------------------------

A Linux Filesystem contains countless directories with many subdirectories which makes it easy to get lost. It is good practice to check your position within
the filesystem regularly.

**Usage**: ``pwd`` 

 :: 

  $ pwd
  /home/fthommen
  $

:index:`date` - Print current date and time
-------------------------------------------

**Usage**: ``date``

 :: 

  $ date
  Tue Sep 25 19:57:50 CEST 2012
  $

.. note:: The :index:`command <time>` ``time`` does something completely different from ``date`` and is *not* used to show the current time.

Moving Around
=============

:index:`cd` - Change the working directory
------------------------------------------

**Usage**: ``cd [new_directory]``

 :: 

  $ pwd
  /home/fthommen
  $ cd /usr/bin
  $ pwd
  /usr/bin
  $

.. note:: Using ``cd`` without a directory is equivalent to "``cd ~``" and changes into the users's homedirectory
.. note:: Please note the difference between absolute paths (starting with "``/``") and relative paths (starting with a directory name)

Special directories:

- "``.``":  The current working directory
- "``/``":  The root directory of this computer
- "``..``": The parent directory of the current working directory
- "``~``":  Your homedirectory

 ::

  $ pwd
  /usr
  $ cd /bin
  $ pwd
  /bin

 ::

  $ pwd
  /usr
  $ cd 
  $ pwd
  /home/fthommen


See What's Around
=================

:index:`ls` - List directory contents
-------------------------------------

**Usage**:  
  ``ls [options] [file(s) or directory/ies]``

:: 

  $ ls
  /home/fthommen
  $ ls -l aa.pdf
  -rw-r--r-- 1 fthommen cmueller 0 Sep 24 10:59 aa.pdf
  $


Useful options:

-l      Long listing with permissions, user, group and last modification date
-1      Print listing in one column only 
-a      Show all files (hidden, "." and "..")
-A      Show almost all files (hidden, but not "." and "..") 
-F      Show filetypes (nothing = regular file, "/" = directory, "*" = executable file, "@" = symbolic link)
-d      Show directory information instead of  directory content
-t      Sort listing by modification time (most recent on top)


.. figure:: _static/LongListingDeconstructed.png

  Elements of a long file listing (``ls -l``)

 
Digression: Shell globs
-----------------------

Files and folders can't only be referred to with their full name, but also with so-called "Shell Globs", which are a kind of simple pattern to address groups of files and folders. Instead of explicit names you can use the following placeholders:

- ``?:``  Any single character
- ``*:``  Any number of any character (including no character at all, but **not** matching a starting ".")
- ``[...]:``    One of the characters included in the brackets.  Use "-" to define ranges  of characters
- ``{word1,word2}:``    Each individual word is expanded

Examples:

- ``*.pdf:``  All files having the extension ".pdf"
- ``?.jpg:``  Jpeg file consisting of only one character
- ``[0-9]*.txt:`` All files starting with a number and having the extension ".txt"
- ``*.???:``  All files having a three-character extension
- ``photo.{jpg,png}:``  "photo.jpg" and "photo.png"

.. note:: The special directory "``~``" mentioned above is a shell glob, too.

Organize Files and Folders
==========================

:index:`touch` - Create a file or change last modification date of an existing file
-----------------------------------------------------------------------------------

**Usage**:  ``touch file(s) or directory/ies``

 :: 

  $ ls afile
  ls: afile: No such file or directory
  $ touch afile
  $ ls afile
  afile
  $

 :: 

  $ ls -l aa.pdf
  -rw-r--r-- 1 fthommen cmueller 0 Sep 24 10:59 aa.pdf
  $ touch aa.pdf
  $ ls -l aa.pdf
  -rw-r--r-- 1 fthommen cmueller 0 Sep 25 22:01 aa.pdf
  $


:index:`cp` - Copy files and folders
------------------------------------

**Usage**:  ``cp [options] sourcefile destinationfile``


 :: 

  $ cp /usr/bin/less /tmp/backup_of_less
  $


**Useful options**:

-r      Copy recursively 
-i      Interactive operation, ask before overwriting an existing file 
-p      Preserve owner, permissions and timestamp 


We copy a set of exercise files from the network share into our home directory:
 :: 

  $ cp -r /g/bio-it/courses/LSB/exercises  ~/exercises
  $

:index:`rsync` - intelligently copying files and folders
--------------------------------------------------------

**Usage**: ``rsync [options] source target``

 ::

  $ rsync -av /etc/ root@taperobot:/etc-backup
  ...
  $

``rsync`` allows you to copy files or folders locally or to wherever you have ``ssh`` access.  You can have ``rsync`` have copying only newer files or only older files.  If copy operation is interrupted, you can rerun ``rsync`` and it will only copy the missing files (in contrast to ``cp`` which will just copy everything again).

``source`` and ``target`` can be local directories or have the form ``user@remotehost:directory``, in which case you'll have to give your password for the remote host.  This latter version will copy over the network.

.. note:: ``rsync`` is one of the few cases, where it effectively matters if a directory is written with an ending slash ("/") or nor: If the source is a directory and ends with a slash, then the *content* of this directory will be copied into the target directory.  If the source doesn't have an ending slash, then *a directory with the same name* will be created *within the target directory*


**Useful option combinations**:

-av  Verbosely copies all source files wich are different (different size, different age) or missing from the source.  **Beware**: This will also copy files which are older on the source side
-au  Silently copies all source files wich are different (different size, different age) or missing from the source.  This combination will *not* overwrite newer files by older ones

This should not copy any new files, as we previously copied these already:
 :: 

  $ rsync -av /g/bio-it/courses/LSB/exercises/  ~/exercises/
  $


:index:`rm` - Remove files and directories
------------------------------------------

**Usage**:  

  ``rm [options] file(s)``

  ``rm -r [options] directory/ies``

 :: 

  $ ls afile
  afile
  $ rm afile
  $ ls afile
  ls: afile: No such file or directory
  $

**Useful options**: 

-i  Ask for confirmation of each removal
-r  Remove recursively
-f  Force the removal (no questions, no errors if a file doesn't exist)

.. note:: rm without the -i option will usually not ask you if you really want to remove the file or directory

:index:`mv` - Move and rename files and folders
-----------------------------------------------

**Usage**:  

  ``mv [options] sourcefile destinationfile``

  ``mv [options] sourcefile(s) destinationdirectory``

 :: 

  $ ls *.txt
  a.txt
  $ mv a.txt b.txt
  $ ls *.txt
  b.txt
  $

**Useful options**: 

-i  Ask for confirmation of each removal

.. note:: You cannot overwrite an existing directory by another one with mv

.. _mkdir:

:index:`mkdir` - Create a new directory
---------------------------------------

**Usage**:  ``mkdir [options] directory``

 :: 

  $ ls adir/
  ls: adir/: No such file or directory
  $ mkdir adir
  $ ls adir
  $

**Useful options**: 

-p   Create parent directories (when creating nested directories)

:: 

  $ mkdir adir/bdir
  mkdir: cannot create directory 'adir/bdir': No such file or directory
  $ mkdir –p adir/bdir
  $

:index:`rmdir` - Remove an empty directory
------------------------------------------

**Usage**:  ``rmdir directory``

 :: 

  $ rmdir adir/
  $

.. note:: If the directory is not empty, ``rmdir`` will complain and not remove it.


View Files
==========

:index:`cat` - Print files on terminal (concatenate)
----------------------------------------------------

**Usage**:  ``cat [options] file(s)``

 :: 

  $ cat  P12931.fasta backup_of_P12931.fasta
  ...
  $


.. note:: The :index:`command <cat>` ``cat`` only makes sense for short files or for e.g. combining several files into one.  See the redirection examples later.


:index:`head` - Print first lines of a textfile
-----------------------------------------------

``head`` is a program on Unix and Unix-like systems used to display the beginning of a text file or piped data.

**Usage**:  ``head [options] file(s)``

 :: 

  $ head /etc/passwd
  root:x:0:0:root:/root:/bin/bash
  bin:x:1:1:bin:/bin:/sbin/nologin
  daemon:x:2:2:daemon:/sbin:/sbin/nologin
  adm:x:3:4:adm:/var/adm:/sbin/nologin
  lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
  sync:x:5:0:sync:/sbin:/bin/sync
  shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
  halt:x:7:0:halt:/sbin:/sbin/halt
  mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
  news:x:9:13:news:/etc/news:
  $

**Useful options**:

-n num  Print num lines (default is 10)


:index:`tail` - Print last lines of a textfile
----------------------------------------------

The ``tail`` utility displays the last few lines of a file or, by default, its standard input, to the standard output.

**Usage**:  ``tail [options] file(s)``

 :: 

  $ tail -n 3 /etc/passwd
  xfs:x:43:43:X Font Server:/etc/X11/fs:/sbin/nologin
  gdm:x:42:42::/var/gdm:/sbin/nologin
  sabayon:x:86:86:Sabayon user:/home/sabayon:/sbin/nologin
  $

**Useful options**:

-n num  Print num lines (default is 10)
-f      "Follow" a file (print new lines as they are written to the file)

.. _less:

:index:`less` - View and navigate files
---------------------------------------

**Usage**:  ``less [options] file(s)``

 :: 

  $ less  P12931.fasta backup_of_P12931.fasta
  ...
  $

.. note:: This is the default "pager" (a program for viewing files page by page, not an old-fashioned telecommunications device) for manpages under Linux unless you redefine your ``$PAGER`` :ref:`environment variable <environment_variables>` 


**Navigation within less**:

===================================    =======
Key(s):                                 Effect:
===================================    =======
up, down, right, left:                  use cursor keys
top of document:                        g
bottom of document:                     G
search:                                 "/" + search-term
find next match:                        n
find previous match:                    N 
quit:                                   q
===================================    =======


Extracting Informations from Files
==================================

:index:`grep` - Find lines matching a pattern in textfiles
----------------------------------------------------------

``grep`` is a command-line utility for searching plain-text data sets for lines matching a regular expression. 

**Usage**:  ``grep [options] pattern file(s)``

 :: 

  $ grep -i ensembl P04637.txt
  DR   Ensembl; ENST00000269305; ENSP00000269305; ENSG00000141510. 
  DR   Ensembl; ENST00000359597; ENSP00000352610; ENSG00000141510. 
  DR   Ensembl; ENST00000419024; ENSP00000402130; ENSG00000141510. 
  DR   Ensembl; ENST00000420246; ENSP00000391127; ENSG00000141510. 
  DR   Ensembl; ENST00000445888; ENSP00000391478; ENSG00000141510. 
  DR   Ensembl; ENST00000455263; ENSP00000398846; ENSG00000141510. 
  $

**Useful options**:

-v      Print lines that do not match
-i      Search case-insensitive
-l      List files with matching lines, not the lines itself
-L      List files without matches
-c      Print count of matching lines for each file

:index:`cut` - extracting columns from textfiles
------------------------------------------------

``cut`` allows to get at individual columns in structured textfiles (for instance CSV files).
By default, ``cut`` assumes the columns are TAB-separated.

**Usage**:  ``cut [options] file(s)``


**Useful options**:

-d DELIM   use DELIM instead of TAB for field delimiter. Make sure to use quotes here!
-f         select only these fields; this can either be a single field, multiple individual fields separated by comma or a range of startfield and endfield separated by dash '-'

**Examples**:

 extract column six from the file *~/exercises/P12931.csv* (which is separated by semicolon ';'):: 

  $ cut -d';' -f6 ~/exercises/P12931.csv
  PMID 
  2136766 
  11804588 
  ...
  $

 extract columns two, three, eight, nine and ten from the same file::

  $ cut -d';' -f2,3,8-10 ~/exercises/P12931.csv
  S; 12; 0.21; ; - 
  S; 17; 0.24; MOD_PKA_1; - 
  S; 17; 0.24; MOD_PKA_1; - 
  S; 17; 0.24; MOD_PKA_1; -
  ...
  $


:index:`sort` - sort a textfile
-------------------------------

The ``sort`` utility is used to sort a textfile (alphabetically or numerically).

**Usage**:  ``sort [options] file(s)``

 :: 

  $ sort /etc/passwd
  ...
  $

**Useful options**:

-f    fold lower case to upper case characters
-n    compare according to string numerical value
-b    ignore leading blanks
-r    reverse the result of comparisons



Useful Filetools
================

:index:`file` - determine the filetype
--------------------------------------

**Usage**:  ``file [options] file(s)``

 :: 

  $ file /bin/date
  /bin/date: ELF 32-bit LSB executable
  $ file /bin
  /bin: directory
  $ file SRC_HUMAN.fasta
  SRC_HUMAN.fasta: ASCII text
  $

.. note:: The command ``file`` uses certain tests and some magic to determine the type of a file

:index:`which` - find a (executable) command
--------------------------------------------

**Usage**:  ``which [options] command(s)``

 :: 

  $ which date
  /bin/date
  $ which eclipse
  /usr/bin/eclipse
  $

:index:`find` - search/find files in any given directory
--------------------------------------------------------

**Usage**:  ``find [starting path(s)] [search filter]``

 :: 

  $ find /etc
  /etc
  /etc/printcap
  /etc/protocols
  /etc/xinetd.d
  /etc/xinetd.d/ktalk
  ...
  $

``find`` is a powerful command with lots of possible search filters.  Refer to the manpage for a complete list.  

**Examples**:

- Find by name: 

 :: 

  $ find . -name SRC_HUMAN.fasta
  ./SRC_HUMAN.fasta
  $


- Find by size: (List those entries in the directory ``/usr/bin`` that are bigger than 500kBytes)

 :: 

  $ find /usr/bin -size +500k
  /usr/bin/oparchive
  /usr/bin/kiconedit
  /usr/bin/opjitconv
  ...
  $


- Find by type (d=directory, f=file, l=link) 

 :: 

  $ find . -type d
  .
  ./adir
  $


:index:`Permissions`
====================

using ``ls -l`` to view entries of current directory: 

 :: 

  $ ls -l
  drwxr-xr-x 2 dinkel gibson 4096 Sep 17 10:46 adir
  lrwxrwxrwx 1 dinkel gibson   15 Sep 17 10:45 H1.fasta -> H2.fasta
  -rw-r--r-- 1 dinkel gibson  643 Sep 17 10:45 H2.fasta
  $

.. figure:: _static/LinuxPermissions.png

  Linux file permissions


Changing Permissions
--------------------

Permissions are set using the ``chmod`` (:index:`change mode <chmod>` ) command. 

**Usage**:  ``chmod [options] mode(s) files(s)``

 :: 

  $ ls -l adir
  drwxr-xr-x 2 dinkel gibson 4096 Sep 17 10:46 adir
  $ chmod u-w,o=w adir
  $ ls -l adir
  dr-xr-x-w- 2 dinkel gibson 4096 Sep 17 10:46 adir
  $

The mode is composed of

+-----+---------------+------+------------------------------+-----+--------------+
| Who                 | What                                |  Which permission  |
+=====+===============+======+==============================+=====+==============+
| u:  |  user/owner   |  +:  | add this permission          |  r: | read         |
+-----+---------------+------+------------------------------+-----+--------------+
| g:  |  group        |  -:  | remove this permission       |  w: | write        |
+-----+---------------+------+------------------------------+-----+--------------+
| o:  |  other        |  =:  | set exactly this permission  |  x: | execute      |
+-----+---------------+------+------------------------------+-----+--------------+
| a:  |  all          |      |                              |     |              |
+-----+---------------+------+------------------------------+-----+--------------+


Add executable permission to the group: 

 :: 

  $ chmod g+x file
  $

Revoke this permission: 

 :: 

  $ chmod g-x file
  $

Allow all to read a directory: 

 :: 

  $ chmod a+rx adir/
  $

:index:`Remote access`
======================

To execute commands at a remote machine/server, you need to log in to this machine. This is done
using the ``ssh`` :index:`command <ssh>` (:index:`secure shell`). In its simplest form, it takes just the machinename as
parameter (assuming the username on the local machine and remote machine are identical): 


 :: 

  $ ssh remote_server
  ...
  $

.. note:: Once logged in, :index:`use <hostname, whoami>` ``hostname,`` ``whoami,`` etc. to
          determine on which machine you are currently working and to get a feeling for your 
          environment!

To use a different username, you can use either: 

 :: 

  $ ssh -l username remote_server
  ...
  $

or 


 :: 

  $ ssh username@remote_server
  ...
  $

When connecting to a machine for the first time, it might display a warning: 

 :: 

  $ ssh submaster
  The authenticity of host 'submaster (10.11.4.219)' can't be established.
  RSA key fingerprint is a4:2c:c1:a6:34:49:a3:a9:b2:c3:52:f5:37:94:69:f5.
  Are you sure you want to continue connecting (yes/no)? 

  ...
  $

Type *yes* here.
If this message appears a second time, you should contact your IT specialist...

To :index:`disconnect <exit, disconnect>` from the remote machine, type: 

 :: 

  $ exit


If setup correctly, you can even use *graphical tools* from the remote server on the local machine. 
For this to work, you need to start the ssh session with the ``-X`` parameter:

 :: 

  $ ssh -X remote_server
  ...
  $

Copying files to and from remote computers can be done using ``scp``  (:index:`secure copy <scp, secure copy>`). 
The order of parameters is the same as in ``cp``: first the name of the source, then the name of the destination. Either one can be the remote part.


 :: 

  $ scp localfile server:/remotefile

  $ scp server:/remotefile localfile

An alternative username can be provided just as in ssh:

 :: 

  $ scp username@server:/remotefile localfile


IO and Redirections
===================

Redirect
--------

:index:`Redirect <redirect, \>>` the output of one program into e.g. a file: 


Inserting the current date into a new file: 

 :: 

  $ date > file_containing_date
  $

.. Warning:: You can easily :index:`overwrite files <file; overwrite>` by this! 

:index:`Filtering <grep>` lines containing the term "src" from FASTA files and inserting them into the file lines_with_src.txt: 

 :: 

  $ cd ~/exercises/
  $ grep -i "src" *.fasta > lines_with_src.txt
  $

:index:`Append <append, file; append, \>\>>`
--------------------------------------------

Append something to a file (rather than overwriting it): 

 :: 

  $ date >> file_containing_date
  $

.. _pipe:

Pipe
----

Use the :index:`pipe <|, pipe>` symbol (``|``) to feed the output of one program into the next program. 
Here: use ``ls`` to show the directory contents and then :index:`use <grep>` ``grep`` to only show those that contain fasta in their name: 

 :: 

  $ cd ~/exercises
  $ ls | grep fasta
  EPSINS.fasta
  FYN_HUMAN.fasta
  P12931.fasta
  SRC_HUMAN.fasta
  $


.. _environment_variables:

Environment Variables
=====================

:index:`Environment variables <environment variables>` are a set of dynamic named values that can affect the way running processes will behave on a computer.

:index:`$HOME`
--------------

Contains the location of the user's home directory. Although the current user's home directory can also be found out through the 
C functions ``getpwuid`` and ``getuid,`` ``$HOME`` is often used for convenience in various shell scripts (and other contexts).

.. note:: Do not change this variable unless you have a good reason and you know what you are doing!

.. _path:

:index:`$PATH`
--------------

``$PATH`` contains a colon-separated (':') list of directories that the shell searches for commands that do not contain a slash in their name 
(commands with slashes are interpreted as file names to execute, and the shell attempts to execute the files directly).
So if the directory ``/usr/bin`` is in ``$PATH`` (which it should), then the command ``/usr/bin/less`` can be accessed by simply typing ``less`` instead of
``/usr/bin/less``. How convenient!

.. Warning:: If you ever need to change this variable, you should always *append* to it, rather
   than overwriting it: 

   Overwriting (bad): ``export PATH=/my/new/path``; 

   Appending (good): ``export PATH=$PATH:/my/new/path``

:index:`$PAGER`
---------------

The ``$PAGER`` variable contains the path to the program used to list the contents of files through (such :index:`as <less>` ``less`` :index:`or <more>` ``more``).

:index:`$PWD`
-------------

The ``$PWD`` variable points to the current directory. Equivalent to the output of the command ``pwd`` when called without arguments.

Displaying environment variables
--------------------------------

:index:`Use <environment variables; display>` ``echo`` to :index:`display <echo>` individual variables `set`` :index:`or <env>` ``env`` to view all at once:

 :: 

  $ echo $HOME
  /localhome/teach01
  $ set
  ...
  $ env
  ...
  $

Setting an environment variable
-------------------------------

Use ``export`` followed by the variable name and the value of the variable (separated by the equal sign) to :index:`set <environment variables; set, set, export>` an environment variable:

 :: 

  $ export PAGER=/usr/bin/less
  $

.. note:: An environment variable is only valid for your current session. Once you logout of your current session, it is lost or reset.


