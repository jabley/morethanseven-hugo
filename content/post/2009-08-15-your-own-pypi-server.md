---
comments: true
created_at: 2009/08/15}
date: 2009-08-15T00:00:00Z
title: Your Own PyPi server
url: /2009/08/15/your-own-pypi-server/
---

So one of the problems with using pip or easy\_install as part of an automated deployment process is they rely on an internet connection. More than that, they rely on PyPi being up as it's a centralised system, unlike all the apt package mirrors.

The best solution seems to be to host your own PyPi compliant server. Not only can you load all the third party modules you use onto it, but you could also upload any internal applications or libraries that you like. By running this on your local network you ensure your not dependent on pypi or an internet connection.

At the moment I'm playing with [Chishop](http://github.com/ask/chishop/tree/master) which is a django application for maintaining a PyPi compatible server. Another alternative if that doesn't work out is [EggBasket](http://pypi.python.org/pypi/EggBasket/)

To install from your own PyPi server you can specify the location of your Chishop instance with the -i flag.

pre. easy\_install -i http://localhost:8000/ PACKAGE\_NAME

This will fall back to the PyPi server if it doesn't find the relevant package. If you want to stop that behaviour and make sure you have a local package then you can limit the hosts with the -H flag like so.

pre. easy\_install -H localhost:8000 -i http::/localhost:8000/ PACKAGE\_NAME

I'm not yet sure how to do this with pip, if someone wants to enlighten me in the comments then I'd be most grateful.
