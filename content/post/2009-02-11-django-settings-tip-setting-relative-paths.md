---
comments: true
created_at: 2009/02/11}
date: 2009-02-11T00:00:00Z
title: 'Django Settings Tip - Setting Relative Paths '
url: /2009/02/11/django-settings-tip-setting-relative-paths/
---

Django settings files are pretty interesting. Rather than being written in some sort of purely declarative markup they just use Python. This brings both lots of power as well as the ability to do things in the settings file that you probably shouldn't do.

One area where I find this capability particularly useful is when specifying file system paths. Lots of the settings concern where Django can find templates, images, or stylesheets for instance. The examples given in the default settings file are all of the form */this/directory/structure/*. If you plan on only working on your own, and never running your applications anywhere except your local machine this is probably fine. The moment you want to deploy your application, or want to collaborate with others this becomes a problem. You either have to agree upon a fixed directory structure between all developers (annoying) or have distinct settings files for each machine, which probably means them being outside source control (also annoying).

A better approach is to have those paths dynamically ascertained at runtime. It makes the application much more portable, making local development and production use easier. Using the standard library *os* module we can do just that.

pre. import os
import django

1.  calculated paths for django and the site
2.  used as starting points for various other paths
    DJANGO\_ROOT = os.path.dirname(os.path.realpath(django.*file*))
    SITE\_ROOT = os.path.dirname(os.path.realpath(*file*))

Here we set a couple of useful constants, one is the path to the site folder and the other the path to where django is stored on this machine. settings.py contains a number of places where these constants are useful. For instance the MEDIA\_ROOT settings which specifies the file system location for assets like images or stylesheets. The default settings file even comes with an instruction and example showing a non portable path.

pre. \# Absolute path to the directory that holds media.

1.  Example: "/home/media/media.lawrence.com/"
    MEDIA\_ROOT = os.path.join(SITE\_ROOT, 'assets')

Other examples include setting the path for a SQLite database:

pre. DATABASE\_ENGINE = 'sqlite3'
DATABASE\_NAME = os.path.join(SITE\_ROOT, 'db') + '/development.db'

Or specifying directories in which we can place templates.

pre. TEMPLATE\_DIRS = (
os.path.join(SITE\_ROOT, 'templates')
)

I actually think this should probably make it's way into the default settings file. I might very well be missing something but I can't see when it's not much better to do things this way.
