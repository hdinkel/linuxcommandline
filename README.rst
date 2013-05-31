Documentation Howto
===================

The folders ''sphinx_beginner'' and ''sphinx_intermediate'' are Re-Writes of the documentation 
which was originally done in Word, converted to ReStructuredText.

Here, we're using `ReStructuredText <http://docutils.sourceforge.net/rst.html>`_ for writing, and `Sphinx <http://sphinx-doc.org/>`_
to convert the Markup into HTML and PDF ("Sphinx is a tool that makes it easy to create intelligent and beautiful documentation") 

Sphinx uses ``conf.py`` for configuration and provides a convenient Makefile for conversion. 
Just call ``make html`` (``make singlehtml`` creates one single HTML file), or ``make latexpdf`` to run it.

Currently, we do not include the HTML output into git, just the PDF and maybe the singlehtml page.

Links/Requirements:

- ReStructuredText https://en.wikipedia.org/wiki/ReStructuredText
- Sphinx >1.1 http://sphinx-doc.org/
- Pygments >1.5  http://pygments.org/

- `ReST Cheat Sheet <http://openalea.gforge.inria.fr/doc/openalea/doc/_build/html/source/sphinx/rest_syntax.html>`_
- `Writing Technical Documentation with Sphinx, Paver, and Cog  <http://doughellmann.com/2009/02/writing-technical-documentation-with-sphinx-paver-and-cog.html>`_
- `using the sffms latex class in sphinx <http://sphinx.pocoo.org/extensions.html http://www.goer.org/Journal/2011/01/publishing_with_sphinx_rest_and_sffms_latex.html>`_


Holger
