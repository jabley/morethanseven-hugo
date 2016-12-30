---
comments: true
created_at: 2010/05/18
date: 2010-05-18T00:00:00Z
excerpt: null
title: Installing Integrity On Debian/Ubuntu
url: /2010/05/18/Installing-integrity-on-debianubuntu/
---

I've been playing with [Integrity](http://integrityapp.com) again as a simple continuous integration server and have installed it on a few debian and ubuntu machines in the last few weeks. The current site has good installation instructions for the Ruby side of things but leaves it as an excercise for the installer to make sure all the system level dependencies are installed.

So probably as much for me in the future, here is what I had to install to get the installation instructions to work for me.

<% syntax_colorize :bash, type=:coderay do %>
apt-get install build-essential
apt-get install ruby
apt-get install rdoc
apt-get install sqlite3
apt-get install libdbd-sqlite3-ruby
apt-get install libdataobjects-sqlite3-ruby1.8 
apt-get install libsqlite3-dev
apt-get install libxml2
apt-get install libxml2-dev
apt-get install libxsl-dev
apt-get install libopenssl-ruby
<% end %>

I also needed to install the following package on Ubuntu:

<% syntax_colorize :bash, type=:coderay do %>
apt-get install ruby1.8-dev
<% end %>

If you want to use a database other than the default SQLite then you won't need those packages and I'll assume you know what you're doing.
