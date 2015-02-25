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
 
  $ ./vartest.sh 
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
