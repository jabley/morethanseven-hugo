---
comments: true
created_at: 2009/02/07}
date: 2009-02-07T00:00:00Z
title: PDB and AppEngine
url: /2009/02/07/pdb-and-appengine/
---

It turns out App Engine breaks the default behaviour of the Python debugger PDB by sending STDOUT to the browser. But with a [little bit of python](http://jjinux.blogspot.com/2008/05/python-debugging-google-app-engine-apps.html) you can put it back in.

pre. import sys
import pdb
for attr in ('stdin', 'stdout', 'stderr'):
setattr(sys, attr, getattr(sys, '**s**' attr))
pdb.set\_trace()
