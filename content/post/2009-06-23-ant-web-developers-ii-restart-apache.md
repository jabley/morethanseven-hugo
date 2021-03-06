---
comments: true
created_at: 2009/06/23}
date: 2009-06-23T00:00:00Z
title: Ant for Web Developers II - Restart Apache
url: /2009/06/23/ant-web-developers-ii-restart-apache/
---

Following on from [yesterdays first useful ant task](http://morethanseven.net/2009/06/22/ant-web-developers-i-backup-config-file/), here's another commonly used task - restarting a remote service. I've used apache in this example, but it could be any service running on your remote machine and it doesn't have to be the restart command.

In order to do this we'll use the [sshexec target](http://ant.apache.org/manual/OptionalTasks/sshexec.html) which has a third party [library dependency](http://ant.apache.org/manual/install.html#librarydependencies). This is the same third party library needed for the scp task in yesterdays post

You need first to download [JSCH](http://www.jcraft.com/jsch/index.html) and then compile the source using ant. Just run *ant dist* in the downloaded folder and you should get a .jar file in the /dist/lib folder. Save this .jar file as as jsch.jar to a folder in your home directory *~/.ant/lib* where ant can automatically load it. Alternatively you can run ant with the -lib command to load libraries from a different location.

pre. ant -lib /tools/ant-libraries

With that out of the way lets have a look at the task.

pre.

<?xml version="1.0" encoding="UTF-8"?>
<project name="example" basedir=".">
<property name="host" value="{host}"/>
<property name="username" value="{user}"/>
<property name="password" value="{password}"/>
<target name="restart-apache" description="execute a remote command to restart apache">
<sshexec host="${host}"
            username="${username}"
            password="${password}"
            command="/etc/init.d/apache2 restart"/>
</target>
</project>

And running it is as simple as:

pre. ant restart-apache

One potential issue with tasks like this is storing the password in the build file in plain text. The target we're using can also use key authentication is you're happy using ssh keys. Alternatively you can set properties on the command line each time you run ant like so.

pre. ant restart-apache -Dpassword={password}
