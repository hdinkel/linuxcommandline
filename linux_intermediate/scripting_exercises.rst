Propositions for Scripting Exercises
====================================

Here are some ideas (not elaborated propositions) for some useful scripts which you might want to implement. 
Extend them to your liking.  
Thanks to Grischa Toedt & Chrysoula Pantzartzi for the ideas.

General "Unpacker"
------------------

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

Required tools and commands:
    :index:`file`, :index:`tar`, :index:`gzip`/:index:`gunzip`, :index:`zip`/:index:`unzip`, :index:`bzip2`/:index:`bunzip2`, :index:`xz`, etc.

Things to consider: 
 * The type of a file is not necessarily deductible from its extension
 * What if the file doesn’t have an extension at all?
 * Depending on the tool and how the file has been archived, the unpacking/uncompressing can result in files 
   being created in a subdirectory or directly in the current working directory. Is this what one wants/expects?
 * What if the destination directory already exists?
 * Some tools preserve the original archive, others don’t

Extendibility:
 * Add option to keep/remove the original archives.
 * Add option to unpack files in a separate directory.
 * Add option to unpack files in directories named after the archive names.  
   Check for already existing target directories!

Safety Backup Creator
---------------------

Purpose: 
    Create a backup copy of a directory/file in a defined location.  E.g. as a safety copy/fallback before applying changes to a dataset etc.

**Usage Example**::

     $ backup.sh datadir
     datadir contains 12 files and is 12 MB in size
     Copying datadir to /home/fthommen/safety_backups/datadir_20-MAY-2014 ... done
     $ backup.sh datadir2
     datadir contains 154 files and is 3 TB in size
     Sorry, /home/fthommen/safety_backups/datadir2_20-MAY-2014 already exists ... aborting
     $

Required tools and commands:
    :index:`cp`, :index:`rsync`, :index:`du`, :index:`ls`, :index:`date`

Things to consider:
  * Already existing safety backups should not be overwritten!
  * Do you or don’t you want to keep the full original path in some form? (dirname, basename)

Extendibility:
  * Add option to pack/compress the data

Column Chooser (advanced)
-------------------------

Purpose:
    Write a script, which takes a textfile with columnar layout and a header line and prints out only columns with the named headers of a textfile with columnar layout

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

Required tools and commands:
    :index:`awk`, :index:`eval`

Extendibility:
  * Add options to define alternate column separators (awk -F)
  * Add option to customize the concatenation of the printed fields
