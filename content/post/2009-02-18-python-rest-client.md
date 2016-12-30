---
comments: true
created_at: 2009/02/18}
date: 2009-02-18T00:00:00Z
title: Python REST Client
url: /2009/02/18/python-rest-client/
---

I'm working on a small project involving using RESTful APIs and wanted a simple HTTP client, something that sat a little higher in the stack than [httplib2](http://code.google.com/p/httplib2/) or similar. I turned initially to the [Django Test Client](http://www.djangoproject.com/documentation/models/test_client/) which now [supports all the required methods](http://code.google.com/p/python-rest-client/) but it turned out that I'd have to unpick it from django a little.

With a little bit of looking around I found the [python-rest-client](http://code.google.com/p/python-rest-client/) which certainly sounded like it would do what I wanted. It lets you make HTTP requests in as straight forward a manner as possible and fitted the bill perfectly.

pre. from restful\_lib import Connection
conn = Connection("http://morethanseven.net")
response = conn.request\_get("/")

It supports authentication, nice helper methods and gives you the response in a nice format.

pre. conn = Connection("http://example.org", username="XXX", password="XXX")
conn.request\_delete('/items/11232344')

As an added benefit it also comes with a Google App Engine compatible version.
