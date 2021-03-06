---
comments: true
created_at: 2009/01/14}
date: 2009-01-14T00:00:00Z
title: Localbuilder on GitHub
url: /2009/01/14/localbuilder-github/
---

One of several little projects I have up and running on [GitHub](http://github.com) at present is [LocalBuilder](http://github.com/garethr/localbuilder/tree/master). It's a pretty simple little script which watches for changes in a given directory and when they occur runs a given command. I knocked it together to use to trigger the running of a test suite each time I save files in a project. It's written in Python but you could use it to run commands in any language you like.

It's all pretty simple Python really and is hopefully reasonably commented and tested so if you're interested you can follow along with [the code](http://github.com/garethr/localbuilder/tree/master). If you just want to use the damn thing then:

    <code>./localbuilder --path /path/to/watch --command /command/to/execute</code>

It turns out Ruby has a much nicer tool to do this and more in autotest, part of the [ZenTest](http://www.zenspider.com/ZSS/Products/ZenTest/) suite of testing tools. I'm finding more and more very nice bits of code written in Ruby of late, but that's probably a whole different blog post.
