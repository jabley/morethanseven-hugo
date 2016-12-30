---
comments: true
created_at: 2009/06/04}
date: 2009-06-04T00:00:00Z
title: Testing WSGI Application with Urltest
url: /2009/06/04/testing-wsgi-application-urltest/
---

I found myself wanted something to make writing high level, functional tests for WSGI application easier and quicker. If I liked the term I'd call it a domain specific language for testing URLs. Basically I found myself writing a lot of tests like:

pre. def test\_404\_handler(self):
response = self.app.get('/does-not-exist', expect\_errors=True)
self.assertEquals("404 Not Found", response.status)

Testing more than a view URLs like this got boring quickly. What I wanted was a short hand syntax for defining this sort of simple test and then running them all individually. So was born [Urltest](http://github.com/garethr/urltest/tree/master). It uses the rather nifty [Webtest](http://pypi.python.org/pypi/WebTest/0.9) module and hooks into unittest from the standard library. You're test script then looks a little like:

pre. \#!/usr/bin/env python
from example\_app import application
from urltest import verify\_urls
if *name* == "*main*":
urls = (
{'url':"/", 'code':200},
{'url':"/bob", 'code':200},
{'url':"/jim", 'code':404},
{'url':"/jim", 'method': "POST", 'code':405},
)
verify\_urls(urls, application)

Let me know if you use it as at the moment this is *works for me* ware, although it's reasonably well tested and commented.
