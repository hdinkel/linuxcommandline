Documentation Howto
===================

The folders ''sphinx_beginner'' and ''sphinx_intermediate'' are Re-Writes of the documentation 
which was originally done in Word, converted to ReStructuredText.

Here, we're using `ReStructuredText <http://docutils.sourceforge.net/rst.html>`_ for writing, and `Sphinx <http://sphinx-doc.org/>`_
to convert the Markup into HTML and PDF ("Sphinx is a tool that makes it easy to create intelligent and beautiful documentation") 

Sphinx uses ``conf.py`` for configuration and provides a convenient Makefile for conversion. 
Just call ``make html`` (``make singlehtml`` creates one single HTML file), or ``make latexpdf`` to run it.
The resulting documents will be in ``_build/html/`` or ``_build/latex/``, respectively.

Currently, we do not include the HTML output into git, just the PDF and maybe the singlehtml page.

Requirements:

- ReStructuredText https://en.wikipedia.org/wiki/ReStructuredText
- Sphinx >1.1 http://sphinx-doc.org/
- Pygments >1.5  http://pygments.org/
- TexLive >2011 http://www.tug.org/texlive/

Links:

- `ReST Cheat Sheet <http://openalea.gforge.inria.fr/doc/openalea/doc/_build/html/source/sphinx/rest_syntax.html>`_
- `ReST and Sphinx Primer <http://openmdao.org/dev_docs/documenting/sphinx.html>`_
- `Writing Technical Documentation with Sphinx, Paver, and Cog  <http://doughellmann.com/2009/02/writing-technical-documentation-with-sphinx-paver-and-cog.html>`_


PS: I've manually updated the Makefiles to do some minor ``sed`` replacement to use the LaTeX package `fancyvrb <http://www.ctan.org/pkg/fancyvrb>`_ for styling
the verbatim boxes; this package should be included in the TeXLive distribution.


Holger
