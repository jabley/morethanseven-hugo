---
comments: true
created_at: 2009/03/14}
date: 2009-03-14T00:00:00Z
title: XMPP and Queues in App Engine via Jaiku? Not quite yet
url: /2009/03/14/xmpp-and-queues-app-engine-jaiku-not-quite-yet/
---

So [JauikuEngine](http://code.google.com/p/jaikuengine), the open source, App Engine based, version of Jaiku is now available for everyone to look at. I [found the repo a couple of days ago](http://twitter.com/garethr/status/1321372099) but it was restricted to project members. The main reason I want to hunt through the code is to have a look at what I'm guessing will be API's available in a soon to be released version of App Engine - with specific interest in anything to do with XMPP, queues and offline processing.

Well it looks like I'm out of luck for the moment at least. In the [settings file](http://code.google.com/p/jaikuengine/source/browse/trunk/settings.py) I found the following two snippets though:

pre. \#

1.  XMPP / IM
    \#
2.  Enabling IM will require a bit more than just making this True, please
3.  read the docs at http://code.google.com/p/jaikuengine/wiki/im\_support
    IM\_ENABLED = False
4.  This is the id (JID) of the IM bot that you will use to communicate with
5.  users of the IM interface
    IM\_BOT = 'root@example.com'
6.  Turn on test mode for IM
    IM\_TEST\_ONLY = False
7.  JIDs to allow when testing live XMPP so you don't spam all your users
    IM\_TEST\_JIDS = \[\]

And another for queues:

pre. \#

1.  Task Queue
    \#
2.  Enabling the queue will allow you to process posts with larger numbers
3.  of followers but will require you to set up a cron job that will continuously
4.  ping a special url to make sure the queue gets processed
    QUEUE\_ENABLED = True
5.  The secret to use for your cron job that processes your queue
    QUEUE\_VENDOR\_SECRET = 'SECRET'

The only problem appears to be that the page referenced, [code.google.com/p/jaikuengine/wiki/im\_support](http://code.google.com/p/jaikuengine/wiki/im_support), currently says:

> TODO (termie): describe how to get IM working with Jaiku Engine

So [termie](http://twitter.com/termie), or anyone else on the inside, I'd love to know how to get this up and running?

I'll be having a better look through the code when I get a chance. This was just the first thing I jumped on before heading out the door. I love Open Source.
