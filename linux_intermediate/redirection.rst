I/O Redirection 
================

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
