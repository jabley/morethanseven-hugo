---
comments: true
created_at: 2009/07/13}
date: 2009-07-13T00:00:00Z
title: It's the Data we Want
url: /2009/07/13/its-data-we-want/
---

> A spreadsheet. A CSV file. Whatever is in use internally. Made available to people like us under a suitable license.

I feel a little self adsorbed quoting myself (from a recent [Refresh Cambridge](http://refreshcambridge.org/) discussion) but I did like the turn of phrase. What I was rambling on about was Cambridge County mapping data, after a question from a nice chap from the council about what *"new, exciting map technology"* we'd like to see. But it applies to any data that you're trying to make public what-so-ever, be it government or otherwise.

What myself and a few other people were talking about, and one of the things that has been discussed as part of the [Rewired State](http://rewiredstate.org/) group, is that it's all about the data, not necessarily about a nice web based API.

Now I've written and spoken about the need for well designed API's being treated as part of the user interface. But remember interface design, and by association API design, isn't easy. API design is often about building manageable flexibility. A public API is often about managing the flow of data you control out to third parties, as well as the information itself it might include limitations on usage, or request rate, or storage. A public API codifies how that information can be accessed. APIs also have to tread a fine line between making it easy for you to solve your problem, and making it easy for everyone else to solve their completely different problems. These compromises are design.

But not everything needs an API. Sometimes it's just about the data, and the best way of getting at that data is as raw as possible. Government data is an easy sell here, as it is (or rather should be) *our* data. It's also for the most part interesting to read rather than write (historical council tax data, or population data for instance). Raw data can generally be provided quicker than via an API. It doesn't need fragile computer systems or extensive manual labour. It doesn't need particularly clever computing resources. Just upload a spreadsheet or a CSV file to a sensible URL on a known, regular basis and away we go.

And giving data like this away to the development community is likely to have a few additional benefits if that data is useful (it probably is to someone). We'll happily write software libraries, or create APIs over the top of it for you. We'll also write all sorts of useful tools using the data in ways no one else thought of. So if you're sat on a load of data that's not core to your business, or is meant to be public anyway, then lets start talking publicly about how to just get this out on the web quickly and cheaply, rather than spending lots of your time and money on something fancy.
