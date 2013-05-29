Basic Shell Scripting
=====================

What is a Script?
-----------------

A script is nothing else than a number of shell command place together in a file. The sim-
plest script is maybe just a complex oneliner that you don’t want to type each time again.
More complex scripts are seasoned with control elements (conditions and loops) which
allow for a sophisticated command flow. scripts might allow for configuration and customi-
zation, thus allowing one script to be flexibly used in several different environments.
Whatever you do in a script, you can also do on the commandline. This is
also the first way to test your scripts step by step!
Script Naming and Organization
It is good practice – though not technically required – to give your scripts an extension
which specifies their type. I.e. “.sh” for Bourne Shell and Bourne Again Shell scripts, “.csh”
for C-Shell scripts. Sometimes “.bash” for Bourne Again Shell scripts is used.
We recommend to either store all scripts in one location (e.g. ~/bin) and add this location to
your $PATH variable or to store the scripts together with the files that are processed by the
script.
If you use scripts to process data, then the scripts should probably be
archived together with the data files
Running a Script
There are basically three ways to run a script:
a) the location to your script is not in your $PATH variable, then you have to specify the
full path to the script:

 ::

  /here/is/my/script.sh
   [...]

b) the location to the script is in the $PATH variable, then you can simply type its name:

 ::

  script.sh
   [...]

In both situations, the script will need to have execute permissions to be run. If for some
reason you can only read but not execute the script, then it can still be run by
c) specifying the interpreter. The full path (relative or absolute) to script has to be provi-
ded in this case, no matter wether the script location is already contained in $PATH or
not:

 ::

  /bin/sh /here/is/my/script.sh
   [...]


Basic Structure of a Shellscript
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Shellscripts have the following general structure:

#. A line starting with “``#!``” which defines the interpreter (i.e. the program used to run the script). This line is called the “shebang line” and must be the first line in a script
#. A section where the configuration takes place, e.g. paths, options and commands are defined and it is made sure, that all prerequisites are met
#. A section where the actual processing is done. This includes error handling
#. A controlled exit sequence, which includes cleaning up all temporary files and returning a sensible exit status

This is merely a recommendation to keep your scripts well structured. None of these sections are mandatory.

Readability and Documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Make your script easily readable. Use comments and whitespace and avoid super compact
but hardly understandable commandlines. Always take into account, that not only the shell,
also human beings will probably have to read and understand your script.
Even if your script is very simple – document it! This helps others understand what you did,
but – most important – it helps you remember what you did, when you have to reuse the
script in the future.

Documentation is done either by writing comments into the script or by creating a special documentation file (README.txt or similar). Documenting in the script can be done in several ways:
#. A preamble in the script, outlining the purpose, parameters and variables of the script as well as some information about authorship and and perhaps changes
#. Within the script as blocks of text or “End of line” comments

To write a comments use the hash sign (“``#``”). Everything after a “``#``” is ignored when executing a script.

Shebang line:

.. literalinclude:: _static/myscript.sh
   :language: bash
   :lines: 1-3
   :emphasize-lines: 1

Preamble with a short description, usage information, authorship etc.:

.. literalinclude:: _static/myscript.sh
   :language: bash
   :lines: 3-13

Configuration:

.. literalinclude:: _static/myscript.sh
   :language: bash
   :lines: 14-16

Checking prerequisites and sane environment:

.. literalinclude:: _static/myscript.sh
   :language: bash
   :lines: 17-30

This is what you actually wanted to do:

.. literalinclude:: _static/myscript.sh
   :language: bash
   :lines: 31-33

Ensure a valid and meaningful exit status:

.. literalinclude:: _static/myscript.sh
   :language: bash
   :lines: 34-


Full script:

.. literalinclude:: _static/myscript.sh
   :language: bash
   :linenos:

