---
comments: true
created_at: 2009/08/21}
date: 2009-08-21T00:00:00Z
title: Django and WSGI deployment on Solaris
url: /2009/08/21/django-wsgi-deployment-solaris/
---

Now I'm generally an Ubuntu guy, but I've just had the need to setup some boxes running Solaris for Django and a handful of WSGI applications. I know my way around Ubuntu pretty well. I know all the packages I need to install and in what order. Hell, I even have all that scripted so I can just run a command and it works by magic. I'll script the following steps if I can do when I get round to it but here, in one list, are the installation instructions for Apache, mod\_wsgi, Mysql, MySQLdb, setuptools and memcached that worked for me on the latest version of [Open Solaris](http://www.opensolaris.com/) (2009.06 at the time of writing).

First up I needed to install Apache and start the service running.

    pfexec pkg install SUNWapch22
    svcadm enable http:apache22

You should be able to test that's running by hitting localhost on a browser running on the same box. Now for MySQL.

    pfexec pkg install SUNWmysql5
    svcadm enable mysql:version_50

This installs the mysql binary into /usr/mysql/5.0/bin/mysql on the system I'm working on. As I want to talk to the MySQL database server using Python I need to install MySQLdb.

    pfexec pkg install SUNWmysql-python
    ln -s /usr/mysql/5.0/lib/mysql/libmysqlclient_r.so.15 /usr/lib/libmysqlclient_r.so.15

This installs the library files into /usr/mysql/5.0/lib and Python doesn't know were to find them. The above command links them into the more standard /usr/lib folder were Python will pick it up nicely.

I tend to use [mod\_wsgi](http://code.google.com/p/modwsgi/) for serving Python apps behind Apache, however a mod\_wsgi package isn't part of the default package list. It is however available in the pending list so first you need to add that list of packages.

    pfexec pkg set-authority -O http://pkg.opensolaris.org/pending pending
    pfexec pkg refresh
    pfexec pkg install mod-wsgi

This installs the module but you then need to tell Apache to load it. Add the following line to /etc/apache2/2.2/conf.d/modules-32.load or /etc/apache2/2.2/conf.d/modules-64.load depending on your architecture.

    LoadModule wsgi_module    libexec/mod_wsgi.so

To get Apache to load that module you need to restart it like so:

    svcadm restart http:apache22

I use [Pip](http://pypi.python.org/pypi/pip) for installing Python code, but tend to install setuptools to make installing Pip easier. I don't know if an up to date Pip package exists.

    pfexec pkg install python-setuptools

This should leave you with easy\_install on your path so installing Pip, then virtualenv should be a breeze.

As an added bonus I also installed memcached for some snappy caching.

    pfexec pkg install SUNWmemcached

This won't start up by default and needs a little configuration. The first command will launch you into a prompt where you can type the rest of the commands.

    svccfg
    svc:> select memcached
    svc:/application/database/memcached> setprop memcached/options=("-u" "nobody")
    svc:/application/database/memcached> quit

Once you'd done that you should be able to start memcache on the standard port.

    svcadm refresh memcached
    svcadm enable memcached

Et voila. The internet helped massively on my quest to track down this information. Not all of the following links turned out to work for me but all of them led me in the right direction. Thanks everyone.

-   http://blogs.sun.com/quenelle/entry/jazz\_guitar\_and\_rpath
-   http://blogs.sun.com/natarajan/entry/installing\_amp\_stack\_within\_glassfish
-   http://blogs.sun.com/overstre/entry/django\_on\_solaris10\_with\_the
-   https://cds.sun.com/is-bin/INTERSHOP.enfinity/WFS/CDS-CDS\_SMI-Site/en\_US/-/USD/ViewProductDetail-Start?ProductRef=Web-Stack-1.5-OTH-G-F@CDS-CDS\_SMI
-   http://wiki.joyent.com/mod\_wsgi
-   http://textusers.com/wiki/AcceleratorDjango
-   http://wiki.joyent.com/accelerators:kb:django
-   http://www.b-list.org/weblog/2007/sep/04/django-accelerated/
-   http://blogs.sun.com/natarajan/entry/getting\_ruby\_or\_amp\_apache
-   http://blogs.sun.com/overstre/entry/opensolaris\_with\_mod\_wsgi
-   http://branesks.blogspot.com/2009/01/installing-modwsgi-on-opensolaris.html
-   http://blogs.sun.com/overstre/entry/django\_on\_opensolaris
-   http://code.google.com/p/modwsgi/wiki/InstallationOnSolaris
-   http://groups.google.com/group/modwsgi/browse\_thread/thread/7e2cc7ce366253cc
-   http://blogs.sun.com/lr/entry/django\_setup\_mysql\_python\_opensolaris
-   http://blogs.sun.com/trond/entry/memcached\_in\_solaris
-   http://blog.hendrikvolkmer.de/2009/1/29/deploying-a-rails-application-on-opensolaris-with-passenger-aka-modrails/

I'm not a Solaris admin. I'm not really a sysadmin at all, I just end up pretending to be one of late. Any experienced Solaris people with experience of these tools reading this I'd be grateful for any hints and tips. Hopefully this saves a few people from the head scratching I've been doing for the last few days.
