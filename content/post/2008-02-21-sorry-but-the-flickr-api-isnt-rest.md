---
comments: true
created_at: 2008/02/21}
date: 2008-02-21T00:00:00Z
title: Sorry, but the Flickr API isn&#39;t REST
url: /2008/02/21/sorry-but-the-flickr-api-isnt-rest/
---

After [SemanticCamp](http://semanticcamp.tommorris.org) me and [Rey](http://icepop.org/) popped in to see [Paul](http://blog.whatfettle.com/) and everyone at [Osmosoft](http://www.osmosoft.com/) towers. A good few interesting conversations ensued, including one about the difference between [mashups and integration](http://blog.whatfettle.com/2008/02/19/mashup-or-integration/). All good fun basically. [Simon](http://simonmcmanus.com/) also had an [interesting take on the topic](http://simonmcmanus.com/2008/02/21/off-the-shelf-integration-in-enterprises/) as well.

What has all this to do with the topic of this post? Well, Simon says:

> When compared to small RESTful APIs like flickr and twitter...

Now I'm not really picking on Simon here, more that I've been meaning to write something on this topic for a while and this proved a good catalyst for a little rant.

The [flickr](http://flickr.com) [API](http://www.flickr.com/services/api/) is pretty darn cool. But it's not RESTful in pretty much any way you want to shake a stick at it. It's a well designed RPC (remote procedure call) API. Now even flickr get this wrong. They even have [a page](http://www.flickr.com/services/api/response.rest.html) which confuses the issue and makes REST out to be a response format based on XML. Bad flickr.

[flickr states](http://www.flickr.com/services/api/request.rest.html) that:

> The REST Endpoint URL is http://api.flickr.com/services/rest/

This turns out to be completely against the whole RESTful principles. Lets try and explain. You can define most of what you want to do with an API with the use of nouns, verbs and content types. REST is based around limiting the set of verbs to those available in HTTP; for instance GET, POST, PUT and DELETE. For any given application or API you'll also specify a set of content types (representations); for instance HTML, JSON or XML. All you get to play around with are the nouns, in the case of the web these are our URLs.

In a typical RPC style API you have one URL (like flickr does) which acts as the end point to which all calls are made. You then probably define a few functions which you can call. Lets look at a simple book example.

    <code>getBook()
    deleteBook()
    createBook()
    editBook()</code>

The RESTful way of designing this might look a little bit more like this:

    <code>GET     /books/{book-id}
    DELETE  /books/{book-id}
    POST    /books
    PUT     /books/{book-id}</code>

We mentioned content types or representations earlier. Lets say instead of the default response format we might want to get a JSON representation of a given book we might do something like the following.

    <code>GET /books/{book-id}.json</code>

The advantages of using URLs as the API nouns in this way include more than just sane URLs for the site or application in question. The web is based around many of these architectural principles and that seemed to scale pretty well. The idea is that fell envisaged RESTful applications have an advantage here too. For me one of the real benefits of RESTful APIs are in the simplicity they bring to documentation. I already know the available verbs, all I need to know are the set of resource URLs and I can probably use CURL to work out the REST (sorry, bad pun).

This misunderstanding is pretty common. Even [WikiPedia](http://en.wikipedia.org/wiki/Representational_State_Transfer) appreciates their is a problem:

> The difference between the uses of the term â€œRESTâ€ causes some confusion in technical discussions.

This isn't just pedantry on my part, well not quite. I'd recommend anyone involved in designing and architecting web sites read [RESTful Web Services](http://www.amazon.co.uk/RESTful-Web-Services-Leonard-Richardson/dp/0596529260) as well as [Roy Fielding's](http://www.ics.uci.edu/~fielding/) [Architectural Styles and the Design of Network-based Software Architectures](http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm). But if you just want to *get* the general principles and don't fancy wading through technical documents then you have to read [How I Explained REST to My Wife](http://tomayko.com/articles/2004/12/12/rest-to-my-wife) hilariously written by [Ryan Tomayko](http://tomayko.com/).

And remember, just because an API makes use of HTTP doesn't make it RESTful. I'm looking at you [twitter](http://twitter.com).
