---
comments: true
created_at: 2008/01/30}
date: 2008-01-30T00:00:00Z
title: Simple deployment with SVN and Phing
url: /2008/01/30/simple-deployment-with-svn-and-phing/
---

Another approach to deploying web apps is to use [Phing](http://phing.info/). Phing is at heart a PHP clone of Ant, another common build and deployment tool. The main advantage of using Phing, at least if you're already using PHP, is close integration with other PHP specific tools (PHPDocumentor, PHPLint and PHPUnit to name a few) and ease of install.

Speaking to installation Phing has it's own PEAR channel. I still think PEAR is great in so many different ways - it always makes me frown when I see people cussing at PEAR (especiallly the installer). You can install Phing as follows.

    <code>pear channel-discover pear.phing.info
    pear install phing/phing</code>

The [Phing documentation](http://phing.info/docs/guide/current/) is nothing if not comprehensive. Unfortunately, unless you are pretty familiar with Ant or you're trying to do something complex (and willing to invest the time) the chances are you'll be a little lost. More and simpler examples for common problems would be useful for those beginners.

I might publish a few little recipes down the line or even a full commented production recipe but for the moment lets start simple. The following build script is designed to be run on your remote web server and relies on a subversion repository (hopefully you're using source control, if not that's another post I'm afraid). It simply exports the specified repository to the specified export directory on the server. Note that you need to set your own SVN details and replace the capitalised properly values. The following should be saved as *build.xml* on your web server, outside the web root.

    <code><?xml version="1.0"?>
    <project name="build" default="main">

      <property name="exportdir"  value="WEB_ROOT" />
      <property name="svnpath" value="YOUR_SVNPATH" />
      <property name="username" value="YOUR_SVN_USERNAME" />
      <property name="password" value="YOUR_SVN_PASSWORD" />
      <property name="repo" value="YOUR_SVN_REPO" />

      <target name="main" depends="svnexport"/>

      <target name="svnexport">
        <svnexport
           svnpath="${svnpath}"
           username="${username}"
           password="${password}"
           nocache="true"
           repositoryurl="${repo}"
           todir="${exportdir}"/>
      </target>
    </project></code>

Let's break some of that down. Property definitions allow you to specify variables for use in your build script. In this example we only have one task specified so maybe we don't need the extra abstraction but the moment we start reusing scripts or adding more tasks it's a good idea.

    <code><property name="exportdir"  value="./web" /></code>

The other major point of interest is the task itself. Here we make use of the properties we have already specified to run a subversion export. The *svnexport* task is build in to Phing.

    <code><target name="svnexport">
      <svnexport
         svnpath="${svnpath}"
         username="${username}"
         password="${password}"
         nocache="true"
         repositoryurl="${repo}"
         todir="${exportdir}"/>
    </target></code>

Also of note is the setting of a default task, *main*, as a property of the project element and specifying that the main task depends on another task, *svnexport*. Again, we could avoid that at this stage but the moment we add another few tasks then we'll want more control over execution order.

Phing should be run from the directory containing the build script. You can run the command without any arguments, in which case the default task will be run (in our case *main*) or you can pass an argument to specify a specific task. For our simple build script the two following commands do the same thing:

    <code>phing</code>

    <code>phing svnexport</code>

Given the above build script simple runs a subversion export command you might be wondering what use it is. The answer is not much at this stage. You *do* get a simple build script which can be stored in your source control system and used by the whole team. The real advantage is where you might go from here. If everyone in your team deploys in the same way (ie. using the build script) then anyone can add extra tasks and everyone gets the benefit. Simple example might be generating code documentation, running Unit tests (and not running the export if the tests fail) and creating a zip file of the deployed source for backup purposes.

Build scripts can get complicated quickly, but if you start out small and add tasks as you need and understand them, you should be able to raise the quality of your application and avoid easy to make mistakes.
