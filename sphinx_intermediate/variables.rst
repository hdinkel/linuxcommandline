Variables 
=========

The shell knows two types of variables: “Local” shell variables and “global”
exported :index:`environment variables`. By convention, environment variables are
written in uppercase letters.

Shell variables are only available to the current shell and not inherited when
you start an other shell or script from the commandline. Consequently, these
variables will not be available for your shellscripts.

Environment variables are inherited to shells and scripts started from your
current. 

Setting, Exporting and Removing Variables 
------------------------------------------

Variables are set (created) by assigning them a value

::

  # MYVAR=something::

There must be no whitespace around the equal sign. To create an environment
variable, export is used. You can either export while assigning a value or in a
separate step. Both of the following procedures are equivalent:

::

  # export MYGLOBALVAR=”something else”

::

  # MYGLOBALVAR=”something else” 
  # export MYGLOBALVAR

.. note:: There is no ``$`` in front of the variable!

Variables are removed with unset:

::

  # unset MYVAR

.. note:: Assigning a variable an empty value (``MYVAR=``) will *not* remove it but simply set
          its value to the empty string! 

Listing Variables 
------------------

You can list all your current
environment variables :index:`with <env>` ``env`` and all shell variables :index:`with <set>` ``set``. The list of
shell variables will also contain all environment variables 

Variable Inheritance 
---------------------

Only environment variables will be available in shells and scripts
started from your current shell. However in shell commands run in subshells
(i.e. commands run within round brackets) also local (shell) variables of your
current shell are available. 

Examples 
---------

Consider the following small shellscript `vartest.sh`: ::

  #!/bin/sh 
  echo $MYLOCALVAR
  echo $MYGLOBALVAR
  echo -----

We will use it in the following examples to illustrate the various variable inheritances:

Set the variables and run the script i.e. in a new shell ::

  # export MYGLOBALVAR=”I am global” 
  # MYLOCALVAR=”I am local” 
  # ./vartest.sh

  I am global 
  ----- 

“source” the script, i.e. run it within your current shell ::

  # ./vartest.sh 
  I am local 
  I am global 
  ----- 

# Access the variables in a subshell::

    # (echo $MYGLOBALVAR; echo $MYLOCALVAR) 
    I am global 
    I am local 


