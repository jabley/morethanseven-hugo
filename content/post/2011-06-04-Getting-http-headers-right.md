---
comments: true
created_at: 2011/06/04
date: 2011-06-04T00:00:00Z
excerpt: null
title: Debugging HTTP Headers with RedBot
url: /2011/06/04/Getting-http-headers-right/
---

I've been using the [Vagrantbox.es](http://www.vagrantbox.es) site as a bit of a playground recently and I've been meaning to blog about some of the overengineering I've been doing. Here's a smaller starter.

Getting the headers returned by your web server correct is both easy to do and easy to forget about. Unless you go actively looking for headers with curl or similar you'll probably miss them, and even then will you spot an incorrect header by eye? [RedBot](http://redbot.org) is an excellent online tool that not only shows you the headers but makes recommendations about what might be missing, invalid or things you haven't considered.

For instance the [RedBot results for vagrantbox.es](http://redbot.org/?uri=http%3A%2F%2Fwww.vagrantbox.es) look like this:

<img src="http://image-host.appspot.com/i/img?id=agppbWFnZS1ob3N0cg0LEgVJbWFnZRjJ4gEM" alt="Debugging information from Redbot"/>

Or at least they do now after a few tweaks to my nginx configuration. In particular I've added

    add_header Vary Accept-Encoding;

I'd assumed that enabling gzip compression with gzip\_vary would have set this automatically and never checked. The way RedBot provides a checklist of recommendations is very handy.

As well as checking the page itself you can also check all the assets associated with a page by adding a query string argument. For instance here is the [assets view for Vagrantbox.es](http://redbot.org/?descend=True&uri=http://www.vagrantbox.es). RedBot also provides a [JSON encoded version of the result](http://redbot.org/?id=o5GXZe&descend=True&format=har) which might be useful in a CI system. If you'd rather run your own instance of the software you can, the code can be found on github at [mnot.github.com/redbot/](http://mnot.github.com/redbot/). It currently doesn't work with HTTPS resources but that's about the only thing I'd like to see added.
