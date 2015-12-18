Propositions for Scripting Exercises
====================================

Here are some ideas (not elaborated propositions) for some useful scripts which you might want to implement. 
Extend them to your liking.  
Thanks to Grischa Toedt & Chrysoula Pantzartzi for the ideas.


Replace Names in SVG
--------------------

A SVG graphic is not a binary file (such as PNG or JPG image) but a textual
description of objects. This allows to use commandline tools to manipulate SVG
graphics.
A simple example SVG like this:

.. image:: _static/badge.pdf

looks like this: ::

    <svg xmlns="http://www.w3.org/2000/svg"
         xmlns:xlink="http://www.w3.org/1999/xlink">
        <rect x="10" y="10" height="80" width="200" style="fill: #00EE00"/>
        <text x="40" y="40">Hello, my name is:</text>
        <text x="40" y="60">FIRSTNAME LASTNAME</text>
    </svg>


Save this text as a file called ``badge.svg``, and write a script to replace
''FIRSTNAME'' and ''LASTNAME'' by a set of names from a CSV file (this file
should just contain a list of names, one per line): ::

    Firstname,Lastname
    Holger,Dinkel
    Frank,Thommen
    ...

Purpose:
    Search/Replace names in a SVG graphic by a list of names from a CSV file.

**Usage Example**::

    $ replace_names.sh badge.svg names.csv

Suggested tools and commands:
    :index:`sed`, :index:`for`/:index:`while`, etc.

Things to consider: 
 * Make sure to create a new SVG file for each entry in the names list.
 * Consider how to name each SVG file. Just number them incrementally? Use Names?
 * If it makes things easier, use two loops, one for replacing FIRSTNAME, then
   another one to replace LASTNAME.


General "Unpacker"
------------------

Several tools exist to pack/unpack files. Unfortunately they have different
functionality and often different commandline parameters. This makes it
difficult to work with them; it would be nice to have a tool which unpacks any
given packed file, automatically recognizing which packing algorithm was used
and just returns the unpacked file.

Purpose:
    Unpack a file or a number of files according to their packing or
    compression format (tar, gzip, zip, bzip, xz, see
    http://en.wikipedia.org/wiki/List_of_archive_formats for more ideas).  This
    script can be used as a general wrapper around the various compression and
    packing tools with an uniform set of options

**Usage Example**::

    $ ls -F
    archive.tar.gz    text.txt    zuppfile
    $ unpack *
    archive.tar.gz is a gzip compressed tarfile ... uncompressed and unpacked
    text.txt is not compressed or packed ... skipping
    zuppfile is a zip compressed archive ... uncompressed and unpacked
    $

Suggested tools and commands:
    :index:`file`, :index:`tar`, :index:`gzip`/:index:`gunzip`, :index:`zip`/:index:`unzip`, :index:`bzip2`/:index:`bunzip2`, :index:`xz`, etc.

Things to consider: 
 * The type of a file is not necessarily deductible from its extension.
 * What if the file doesn’t have an extension at all?
 * Depending on the tool and how the file has been archived, the unpacking/uncompressing can result in files 
   being created in a subdirectory or directly in the current working directory. Is this what one wants/expects?
 * What if the destination directory already exists?
 * Some tools preserve the original archive, others don’t... Maybe you can add
   consistency here?

Extendibility:
 * Add option to keep/remove the original archives.
 * Add option to unpack files into a separate directory.
 * Add option to unpack files in directories named after the archive names.  
   Check for already existing target directories!


Safety Backup Creator
---------------------

One cannot have enough backups!!!
However creating a backup can be tedious, so it's better to have a script which
semi-automates this task.

Purpose: 
    Create a backup copy of a directory/file in a defined location. E.g. as a
    safety copy/fallback before applying changes to a dataset etc.

**Usage Example**::

     $ backup.sh datadir
     datadir contains 12 files and is 12 MB in size
     Copying datadir to /home/fthommen/safety_backups/datadir_20-MAY-2014 ... done
     $ backup.sh datadir2
     datadir contains 154 files and is 3 TB in size
     Sorry, /home/fthommen/safety_backups/datadir2_20-MAY-2014 already exists ... aborting
     $

Suggested tools and commands:
    :index:`cp`, :index:`rsync`, :index:`du`, :index:`ls`, :index:`date`

Things to consider:
  * Already existing safety backups should not be overwritten!
  * Do you or don’t you want to keep the full original path in some form? (dirname, basename)

Extendibility:
  * Add option to pack/compress the data.

Column Chooser (advanced)
-------------------------

Purpose:
    Write a script, which takes a textfile with columnar layout and a header
    line and prints out only columns with the named headers of a textfile with
    columnar layout

**Datafile**::

    NAME    FIRSTNAME       BIRTHDATE       STREET  NO
    Meier   Daniel  30-MAY-1990     Meyerhofstrasse 12
    Mueller Andreas 29-FEB-1960     Bahnhofstr.     1b
    Schmid  Ariane  1-DEC-1990      Bahnhofstrasse  13
    vonMyra Nikolaus        15-MAR-270      Dezemberstrasse 6

**Usage Example**::

    $ columnchooser.sh FIRSTNAME NO
    Daniela 12
    Andreas 1b
    Ariane 13
    Nikolaus 6
    $ columnchooser.sh CITY
    Sorry, no column “CITY” found
    $

Suggested tools and commands:
    :index:`awk`, :index:`cut`, :index:`eval`

Extendibility:
  * Add options to define alternate column separators (awk -F).
  * Add option to customize the concatenation of the printed fields.
