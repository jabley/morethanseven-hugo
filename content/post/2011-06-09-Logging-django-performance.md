---
comments: true
created_at: 2011/06/09
date: 2011-06-09T00:00:00Z
excerpt: null
title: Logging Django Performance
url: /2011/06/09/Logging-django-performance/
---

I've been doing some basic performance profiling work with Ruby on Rails recently and one tool I found very useful was the [request log analyzer](https://github.com/wvanbergen/request-log-analyzer). It's a relatively simple command line application that you can point at the Rails application log files and it outputs lots of information in agregate. So information about request duration averages or about SQL queries run. When working on a recent Django project I wanted a tool to do the same thing and ended up writing timelog.

I did a bit of research to see if I could find something similar. Here are a few other interesting tools that didn't quite do what I wanted:

-   [Django Slow Log](https://github.com/jmoiron/django-slow-log) - This logs things like memory and load averages
-   [Django Dump Slow](https://github.com/lamby/django-dumpslow) - Similar but designed to just log slow requests rather than everything, also needs a Redis backend
-   [Zamboni Middleware](https://github.com/jbalogh/zamboni/blob/master/apps/amo/middleware.py#L162) - This is very similar to what I wanted, but it's not a separate module and I didn't find anything to analyse the results

Timelog is very similar to the middleware in Zamboni, the only real difference being I'm using the new logging support in Django 1.3. More interesting is the bundled management command which will output something like:

    +--------------------------+--------+--------+-------+---------+---------+-------+-----------------+
    | view                     | method | status | count | minimum | maximum | mean  | stdev           |
    +--------------------------+--------+--------+-------+---------+---------+-------+-----------------+
    | boxes.viewsBoxDetailView | GET    | 200    | 9430  | 0.14    | 0.28    | 0.21  | 0.0700037118541 |
    +--------------------------+--------+--------+-------+---------+---------+-------+-----------------+
    | boxes.viewsBoxListView   | GET    | 200    | 66010 | 0.17    | 0.28    | 0.232 | 0.0455415351076 |
    +--------------------------+--------+--------+-------+---------+---------+-------+-----------------+
    | django.views.staticserve | GET    | 200    | 61295 | 0.00    | 0.02    | 0.007 | 0.0060574669888 |
    +--------------------------+--------+--------+-------+---------+---------+-------+-----------------+

At the moment I've not done any real benchmarking or optimisation of the script, but it will chew through a 300,000 line (20MB) log file in under 20s on my aging macbook.

The code for Timelog is on github at [github.com/garethr/django-timelog](http://github.com/garethr/django-timelog) and I've uploaded to PyPi as well at [pypi.com/django-timelog](http://pypi.python.org/pypi/django-timelog). You can install it with the usual tools like pip:

    pip install django-timelog

Once installed you need to do a little configuration to get things working. First add the middleware to your MIDDLEWARE\_CLASSES in your settings file.

    MIDDLEWARE_CLASSES = (
      'timelog.middleware.TimeLogMiddleware',

Next add timelog to your INSTALLED\_APPS list. This is purely for the management command discovery.

    INSTALLED_APPS = (
      'timelog',

Then configure the logger you want to use. This really depends on what you want to do, the django 1.3 logging setup is pretty powerful. Here's how I've got logging setup as an example:

    TIMELOG_LOG = '/path/to/logs/timelog.log'

    LOGGING = {
      'version': 1,
      'formatters': {
        'plain': {
          'format': '%(asctime)s %(message)s'},
        },
      'handlers': {
        'timelog': {
          'level': 'DEBUG',
          'class': 'logging.handlers.RotatingFileHandler',
          'filename': TIMELOG_LOG,
          'maxBytes': 1024 * 1024 * 5,  # 5 MB
          'backupCount': 5,
          'formatter': 'plain',
        },
      },
      'loggers': {
        'timelog.middleware': {
          'handlers': ['timelog'],
          'level': 'DEBUG',
          'propogate': False,
         }
      }
    }

In order for the analyser script to work correctly you'll need to use the plain formatter and to register a handler for the timelog.middleware logger.

With that all configured try hitting your application a few times. You should see a log file created at the location specified in TIMELOG\_LOG. Fill that up with a few lines and then run the analyze\_timelog management command:

    python manage.py analyze_timelog

This should output something similar to the above table but with your timings and views. The management command currently allows you to point the analyzer at a different file say from a backup, or a file you've pulled down from production but want to run the command locally. I'll likely add some filters as time permits for things like not showing all views or showing only views between a given date range.

The above table showing the view function is good for big picture trends, but if you want to dig down into a particular path then you can pass an argument to not reverse the path:

    python manage.py analyze_timelog --noreverse

This should give you something more like:

    +----------------------------------+--------+--------+-------+---------+---------+-------+------------------+
    | view                             | method | status | count | minimum | maximum | mean  | stdev            |
    +----------------------------------+--------+--------+-------+---------+---------+-------+------------------+
    | /assets/css/main.css             | GET    | 200    | 61295 | 0.00    | 0.02    | 0.007 | 0.0060574669888  |
    +----------------------------------+--------+--------+-------+---------+---------+-------+------------------+
    | / bob                            | GET    | 404    | 4715  | 0.01    | 0.01    | 0.01  | 0.0              |
    +----------------------------------+--------+--------+-------+---------+---------+-------+------------------+
    | /                                | GET    | 200    | 66010 | 0.17    | 0.28    | 0.232 | 0.0455415351076  |
    +----------------------------------+--------+--------+-------+---------+---------+-------+------------------+
    | /__debug__/m/css/toolbar.min.css | GET    | 304    | 4715  | 0.00    | 0.00    | 0.0   | 0.0              |
    +----------------------------------+--------+--------+-------+---------+---------+-------+------------------+
    | /14/                             | GET    | 200    | 9430  | 0.14    | 0.28    | 0.21  | 0.0700037118541  |
    +----------------------------------+--------+--------+-------+---------+---------+-------+------------------+
