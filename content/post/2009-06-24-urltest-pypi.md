---
comments: true
created_at: 2009/06/24}
date: 2009-06-24T00:00:00Z
title: Urltest on PyPi
url: /2009/06/24/urltest-pypi/
---

I've been meaning to add some of my code to the [Python Package Index](http://pypi.python.org) for a while and have finally gotten around to it with [Urltest](http://github.com/garethr/urltest/tree/master), my simple DSL for testing WSGI apps.

You can now find it at [pypi.python.org/pypi/urltest](http://pypi.python.org/pypi/urltest) and install it using setuptools with:

pre. easy\_install urltest

At the moment I've not added any categorisation or detailed description to the setup.py file, I'll be doing that soon. I wanted to get it working with the absolute minimum setup.py file, which turned out to look like:

pre. \#!/usr/bin/env python
from setuptools import setup, find\_packages
setup(
name = "urltest",
version = "0.1",
author = "Gareth Rushgrove",
author\_email = "gareth@morethanseven.net",
url = "http://github.com/garethr/urltest",
packages = find\_packages('src'),
package\_dir = {'':'src'},
)

Uploading it to PYPI itself was incredibly simple, partly as I was already using setup tools for local installation.

pre. python setup.py register
python setup.py bdist\_egg upload

Let me know if anyone uses this and gets it working. I'll be adding more details and maybe even some more features when I get the chance. Once I do that I'll probably work on a few more packages as well.
