---
comments: true
created_at: 2009/06/22}
date: 2009-06-22T00:00:00Z
title: Ant for Web Developers I - Backup Config File
url: /2009/06/22/ant-web-developers-i-backup-config-file/
---

I occasionally get [carried away](http://morethanseven.net/2009/01/24/defence-apache-ant/) with [Apache Ant](http://ant.apache.org/). For those that haven't come across it, Ant is a build tool written in Java, using an XML syntax to describe a series of repeatable tasks. In your typical web standards savvy, dynamic language favouring, web developer types that description is probably all they (think they) need to know. It's Java. It's XML. It's only really useful in the context of building software (dull).

But I think Ant is a particularly handy tool to have around for anyone working on even simple websites. A couple of strong use cases come to mind:

-   If you're working in a team environment then build files are hugely useful when introducing new people to the team, or when moving people around. Getting code up and running at the start of a project, or if you join the team part way through, can be tricky. A well written build file can automate this.
-   Even when working on projects on my own I tend to write simple build files. The main reason is so I don't forget how to do something. How do you deploy this particular site? How do you run the test suite or generate the documentation? Build files can encapsulate this, and rather than documentation that might be out of date the build file will be executed to do that job in question.

So with all that in mind I'm going to try and do a series of posts each covering a single task, aiming to cover things that your regular web developer will find useful. With that in mind if anyone has any requests or questions let me know either by email or in the comments.

Out first task lets us backup a file from our remote web server, in this case it's the apache2.conf file used to setup apache. Obviously it could be any file you want to get hold of. The example below has a couple of properties for the username and hostname of the remote machine. Save the following snippet into a file called build.xml and place it anywhere you like on your machine.

pre.

<?xml version="1.0" encoding="UTF-8"?>
<project name="example" basedir=".">
<property name="username" value="{user}"/>
<property name="host" value="{host}"/>
<target name="backup-apacheconf" description="backup apache2.conf file from a remote server">
<exec executable="scp" dir="." failonerror="true">
<arg value="${username}@${host}:/etc/apache2/apache2.conf"/>
<arg value="apache2.conf"/>
</exec>
</target>
</project>

Running the task, once you have ant installed (it comes already installed on OS X and is generally available in whatever linux package management system you prefer), is as simple as typing the following into a console.

pre. ant backup-apacheconf

This should download the apache2.conf file to you local machine, into the same directory as your build file.

The above task requires that you have scp installed on your machine, which is pretty likely if you're using OS X or Linux. Ant comes with an inbuilt *scp* task, but it requires you to install a separate java library. If you're happy doing that then you can write tasks like:

pre.

<?xml version="1.0" encoding="UTF-8"?>
<project name="example" basedir=".">
<property name="username" value="{user}"/>
<property name="password" value="{password}"/>
<target name="backup-apacheconf" description="backup apache2.conf file from a remote server">
<scp file="${username}@${host}:/etc/apache2/apache2.conf" todir="." password="${password}"/>
</target>
</project>
