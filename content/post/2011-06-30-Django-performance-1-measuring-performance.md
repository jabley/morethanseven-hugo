---
comments: true
created_at: 2011/06/30
date: 2011-06-30T00:00:00Z
excerpt: null
title: 'Django Performance Patterns 1: Measuring Performance'
url: /2011/06/30/Django-performance-1-measuring-performance/
---

Preface
-------

As Django has matured it's being used for bigger and bigger projects. At the same time it's also being used by more and more people building relatively simple applications quickly. Everyone's application is different, but I'd wager the vast majority of these have a range of common performance problems. Performance is often something only larger teams get to spend time really getting to grips with. This is sometimes because smaller projects can't afford the time, or more often probably that things are thought to be *fast enough* anyway.

One advantage of using a framework is the sharing of common solutions to common problems that happens as a community forms. In what is hopefully going to be a bit of a series I'm going to cover some simple things everyone can do to improve application performance. The patterns are generally applicable, but I'm going to focus on Django examples.

I'm going to be pretty opinionated about the stack I'm using when necessary. I'm not looking to compare different web servers or databases or python versions. And I'd rather give concrete examples than generalise. If you're using a different stack that's fine, somethings will just work and others will need you to know how to configure the software you've already chosen. I'm also going to focus on a very small and simple to understand application. Most of these techniques scale up just fine, but I feel people don't often use them on smaller projects because they thing you can *only* use them on larger ones. Or that you won't see much impact on a smaller project. Both of these don't ring true in my opinion and I'll hopefully show why.

Measuring Performance
---------------------

In this first part of the series lets take a quick detour to frame everything else. Lets talk about ways we can measure performance so we can see if the changes we're making have the desired impact. If you're not measuring performance already then start here.

We'll start out looking at a few tools which are useful when taking a view by view approach to analysing performance. These generally ignore the impact of load on the system but because of this are generally easier to understand and read.

Django Debug Toolbar
--------------------

Most Django developers will hopefully already be using the excellent [Debug Toolbar](.) It has a number of features relevant to our current quest but the most interesting is the query count. Less queries is nearly always better. That's a whopping generalisation, but looking for unnecessary queries or duplicated queries or particularly slow running queries is a great way of making your application faster. The ORM makes it pretty easy to end up with a querysplosion if you're not paying attention.

It's very simple to install:

    pip install django-debug-toolbar

The query section shows you the number of queries, the individual queries themselves and the time taken. It's designed to be run in debug mode, so the actual query times will likely be lower in production, but the query that's taking ages in development will probably still be slow when you go live.

<img src="http://image-host.appspot.com/i/img?id=agppbWFnZS1ob3N0cg0LEgVJbWFnZRiB-gEM" alt="Django debug toolbar"/>

YSlow
-----

[YSlow](http://developer.yahoo.com/yslow/) is a browser extension for Firefox and Chrome that gives information and recommendations about a number of mainly HTTP, CSS or javascript issues individual pages might have. It will give you a score as well as suggestions for improvement:

<img src="http://image-host.appspot.com/i/img?id=agppbWFnZS1ob3N0cg0LEgVJbWFnZRiC-gEM" alt="YSlow showing a score of 96"/>

Also useful is the break down of the number of HTTP requests, and the affect of a primed cache on page loading.

<img src="http://image-host.appspot.com/i/img?id=agppbWFnZS1ob3N0cg0LEgVJbWFnZRjpgQIM" alt="YSlow showing http request breakdown">

Profiling Middleware
--------------------

Sometimes you want to know the very low level calls that go into making a page render. For this you'll want to look at profiling tools. The Django wiki has a [useful page on profiling](https://code.djangoproject.com/wiki/ProfilingDjango) which is good if dispiriting reading.

Django Snippets has several profiling middleware, one of which is packaged up in the excellent [Django Snippetscream](http://pypi.python.org/pypi/django-snippetscream). We can install that like so:

    pip install django-snippetscream

Just include the middleware in your debug environment:

    MIDDLEWARE_CLASSES = MIDDLEWARE_CLASSES + ('snippetscream.ProfileMiddleware',)

You can then append ?prof to any of your URLs and instead of seeing the view you'll see something like the following:

<img src="http://image-host.appspot.com/i/img?id=agppbWFnZS1ob3N0cg0LEgVJbWFnZRjRiQIM" alt="Profiling view"/>

Look at where your code spends it's time and whether you have repeated calls to the same methods and functions. Sometimes getting down to this level of detail is the easiest way of finding the bottleneck in your application.

Nginx Logging
-------------

Here's the first time I'm being opinionated about the stack, by choosing Nginx as my frontend server. I'll talk a little about why this is a good idea later, but for the moment lets concentrate on why this is useful for measuring performance.

Log files are wonderful things, and Nginx has quite a powerful syntax for [adding extra information to log files](http://wiki.nginx.org/HttpLogModule). Note the last line in the definition below.

    log_format timed_combined '$remote_addr - $remote_user [$time_local]  '
          '"$request" $status $body_bytes_sent '
          '"$http_referer" "$http_user_agent" '
          '$request_time $upstream_response_time $gzip_ratio';

We are adding the entire request time, the time taken by the upstream server (in my case gunicorn) to respond and also the gzip ratio. This is really handy if you're optimising an application already in production. By collecting this data here it's easy to then analyse the logs and pull out things like slow urls or assets not being gzipped effectively.

Django Timelog
--------------

Very similar to the above nginx logging, but implemented as a django 1.3 application (so it can be used in development as well) is one of my projects, [django-timelog](https://github.com/garethr/django-timelog). As well as logging the time taken for each request, django-timelog provides a management command to analyse the resulting log file. It produces output which can show in aggregate the average response time of either views or individual URLs.

    +--------------------------+--------+--------+-------+---------+---------+-------+-------+
    | view                     | method | status | count | minimum | maximum | mean  | stdev |
    +--------------------------+--------+--------+-------+---------+---------+-------+-------+
    | boxes.viewsBoxDetailView | GET    | 200    | 9430  | 0.14    | 0.28    | 0.21  | 0.070 |
    +--------------------------+--------+--------+-------+---------+---------+-------+-------+
    | boxes.viewsBoxListView   | GET    | 200    | 66010 | 0.17    | 0.28    | 0.232 | 0.045 |
    +--------------------------+--------+--------+-------+---------+---------+-------+-------+
    | django.views.staticserve | GET    | 200    | 61295 | 0.00    | 0.02    | 0.007 | 0.006 |
    +--------------------------+--------+--------+-------+---------+---------+-------+-------+

It's packaged so installation should be straightforward.

    pip install django-timelog

Again this can be used in a production environment, or it can be used locally while developing. You can also use load testing tools as described in a moment to generate traffic which is then logged.

Load Testing
------------

I'm mainly looking for a tool here which can easily generate HTTP traffic in volume, sending a decent number of concurrent requests against your application and returning some useful results. I mainly turn to ab ([Apache bench](http://httpd.apache.org/docs/2.0/programs/ab.html)) because it's available everywhere and it's very simple to use.

For example lets hit a site with 100 requests, with requests being sent in batches of 5.

    ab -c 5 -n 100 http://www.vagrantbox.es/12/

This will print something like the following. For our purposes we're mainly interested in the requests per second value and the mean request time.

    Concurrency Level:      5
    Time taken for tests:   1.981 seconds
    Complete requests:      100
    Failed requests:        0
    Write errors:           0
    Total transferred:      328300 bytes
    HTML transferred:       297400 bytes
    Requests per second:    50.47 [#/sec] (mean)
    Time per request:       99.064 [ms] (mean)
    Time per request:       19.813 [ms] (mean, across all concurrent requests)
    Transfer rate:          161.82 [Kbytes/sec] received

Load testing is a pretty large topic. For instance even with the above simple example how do we know if 100 requests is enough? (it's not.) Or whether a concurrency of 5 is useful? Often what you're interested in is where your application starts to saturate or where it starts to error. But even without getting bogged down in the details a simple test like this can show changes have had a positive or negative effect. I'll show examples of this as we investigate optimisation techniques.

If you're working on a larger project hopefully you'll have the time to investigate other approaches too. I'm quite a fan of using production logs to replay requests for instance, and of using [Funkload](http://funkload.nuxeo.org/) for running scenarios under load. I'll hopefully write more about those later. I've heard good things about [Tsung](http://tsung.erlang-projects.org/) as well, [HTTPerf](http://www.hpl.hp.com/research/linux/httperf/) is excellent and [JMeter](http://jakarta.apache.org/jmeter/) has many fans. I'm using ab for examples because it's point and shoot and you probably already have it installed without knowing.

Hopefully that's a useful list of tools to get a baseline of where you're at with performance. The rest of the articles in this series will show approaches to improve performance, and come back to one or more of these tools to confirm we're heading in the right direction.
