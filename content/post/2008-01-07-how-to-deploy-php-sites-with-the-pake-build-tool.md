---
comments: true
created_at: 2008/01/07}
date: 2008-01-07T00:00:00Z
title: How to deploy PHP sites with the Pake build tool
url: /2008/01/07/how-to-deploy-php-sites-with-the-pake-build-tool/
---

So in case you hadn't guessed project automation is the new black. I've been getting back into some development work recently with [Is it Birthday?](http://isitbirthday.com) and [getjobsin](http://getjobsin.com) and trying to automate as much of the repetitive and boring work as possible.

I'm not absolutely sure that that many people outside large or particularly organised teams realise that large web sites are not generally *deployed* by someone with an FTP client and crossed fingers. This sort of effort, along with other repetitive tasks like running tests or generating documentation, can be automated. This is a win-win for everyone. It's more reliable (scripts don't forget to restart a service before they go home), quicker and removes the need for having one person in charge of deployments.

Even where people know about this build process idea they might not use it for their projects, probably for similar reasons why not everyone uses source control. I think the reason is probably that most web designers and developers (even particularly geeky ones) thing this software engineering stuff is maybe a step too far. Their is also something of a barrier to entry, knowing where to look and how to get started without reading lots of documentation (often filled with XML examples) and trial and error. Also project automation is apparently not sexy?

Anyway, if you've been working with Rails you will have come across [Rake](http://rake.rubyforge.org/), which is a build tool used to automate various tasks. Well the nice [symfony](http://www.symfony-project.org/) people have written a PHP version called [Pake](http://www.pake-project.com/) for use as part of the framework. It's used for all the command line action, from running tests to clearing the cache and [automating deployments](http://www.symfony-project.org/book/1_0/16-Application-Management-Tools#Using%20rsync%20for%20Incremental%20File%20Transfer). Pake is however a separate tool that you can use in your own projects, whatever framework or hand rolled codebase you are using.

Pake can be downloaded using [PEAR](http://pear.php.net) on the command line:

    <code>pear upgrade PEAR
    pear channel-discover pear.symfony-project.com
    pear install symfony/pake</code>

The documentation for Pake is pretty much non-existent as far as I can tell, but it is a really handy tool so worth a little effort. The best source of knowledge is to look through the default Pake tasks that are provided as part of symfony. One of my favourites, which we'll look at now, allows for incremental deployments via Rsync over SSH. I've been using this with non-symfony projects too.

Rsync is a command line tool for syncronising two file structures. The Rsync command that does most of the heavy lifting for the deployment looks like the following. Note I've used {} to denote placeholders in the following examples.

    <code>rsync --progress --azC --force \
    --delete -e ssh ./ {user}@{host}:{dir}</code>

The sync task I'm using is straight from symfony, but the licence allows for distribution so here is an [example zip of all the files needed to follow along](http://morethanseven.net/_assets/downloads/pake/pake.zip). You'll need these to follow along as I haven't printed the full sourcecode for the pakefile here.

First a little configuration. Using [YAML](http://www.yaml.org/) we define an environment, *staging* in this case\_ and specify a host, port, user and the full path on the remote server. You can of course specify multiple environments in this file, we'll see how to use them shortly.

    <code>[staging]
      host={host}
      port=22
      user={user}
      dir={dir}</code>

You can also include an *rsync\_exclude.txt* or an *rsync\_include.txt* file. This gives you control over the files being synced when you run the Pake task. The following example is a good starting point, it stops you pushing those pesky .DS\_Store files that OSX creates to you web server, as well as avoiding subversion metadata and the configuration files for the Pake task.

    <code>.svn
    .DS_Store
    /config/properties.ini
    /config/rsync_exclude.txt
    /config/rsync_include.txt
    /config/rsync.txt</code>

We can now run the following command, from the directory containing the pakefile.php script, using Pake. The first example will do a dry run, showing you what will happen. You'll be prompted for your SSH password as part of the command unless you're using keys for authentication.

    <code>pake sync staging</code>

When you're happy you can run the sync command with the go option which will instruct Rsync to do it's thing.

    <code>pake sync staging go</code>

Pake has a handy flag to find out what tasks are available.

    <code>pake -T</code>

This should give you a list of tasks and a brief description, useful to find out what you can do if you've been away from a project for a while.

This is a pretty simple example but one I'm already finding useful. Rsync is but one way of deploying apps but with Pake has the advantage of being simple and in lots of situations good enough. It's certainly better than a manual deployment process. It would be simple enough to build into the task a simple logging system so you have a log of all deployments; when they happened and who did them for instance.

If that has whet your appetite then their are other deployment tools you might want to look into; [Capistrano](http://www.capify.org/) (Ruby), [Ant](http://ant.apache.org/) (Java), [Maven](http://maven.apache.org/) (Java) and [Phing](http://phing.info) (PHP) spring to mind. If anyone knows of a Python equivalent that would be useful too? I'm also using Phing for a few tasks on projects at the moment, mainly for some nifty Subversion tasks (and you can use Phing with Pake as symfony does), but that will have to wait until another post.

So, what are peoples experiences of build tools? Any good pointers? Or maybe reasons why you don't use them in your projects?
