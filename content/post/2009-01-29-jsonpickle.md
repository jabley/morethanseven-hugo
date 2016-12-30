---
comments: true
created_at: 2009/01/29}
date: 2009-01-29T00:00:00Z
title: Jsonpickle
url: /2009/01/29/jsonpickle/
---

[Jsonpickle](http://code.google.com/p/jsonpickle) is a Python library for serializing any arbitrary object graph into JSON. The advantage over something like simplejson is the *arbitrary* part, simplejson throws errors when you try and serialize some types of objects. I also prefer the jsonpickle API (encode, decode) over simplejson (dump, dumps, load, loads).
