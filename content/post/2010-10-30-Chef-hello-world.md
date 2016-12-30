---
comments: true
created_at: 2010/10/30
date: 2010-10-30T00:00:00Z
excerpt: A very simple Chef example
title: Chef Hello World
url: /2010/10/30/Chef-hello-world/
---

I've been playing with Chef recently, in particular the solo variant. The new job at FreeAgent meant setting up new development virtual machines and rather than just jot down instructions I decided to script everything. I'd been wanting an excuse to take a look at Chef for a while and it's certainly suited to this sort of job.

Unfortunately the *getting started* documentation isn't yet great. I'm pretty sure this will improve over time, I had exactly the same problem with the Puppet docs a year ago. The main problem I had was I wanted to know how to use it, not just how to download someone elses cookbook. What I wanted was the following, the absolute simplest thing that will work. A Hello World example for Chef if you will. I'll say now that I'm not an expert, their may be ways of doing this that are even simpler, but this works for me. And before someone mentions knife or rake tasks a generator isn't simpler. It might be better when you know what's going on but until you do it's a big ass abstraction that will just get in the way.

All my sample cookbook is going to do is install a single package, curl. I'm going to assume you have chef installed for this already. The documentation did an OK job of that, although I'm relativly familiar with installing gems. I did find that the default system packages on Ubuntu at least were way out of date. Either get the packages direct from opscode or use the gem.

First create a directory and file structure that looks like this:

    -- config
       -- node.json
       -- solo.rb
    -- cookbooks
       -- example
          -- recipes
             -- default.rb

When you run the chef-solo command you need to tell it a few bits of information. The minimum appears to be just telling it where to find the cookbook we're going to create. I think you can call this file anything you like but in the tree above it's called solo.rb.

    cookbook_path File.expand_path(File.join(File.dirname(__FILE__), '..', "    cookbooks"))

Next up is the details of the given node. This in our very simple case is just a list of the recipes we want to run when we execure chef-solo. Put the following content in the node.json file in the config directory as indicated above:

    {
      "run_list": [ "recipe[example]" ]
    }

Last up we want to create a cookbook. Now you can go and download example cookbooks from all over the place. This is great for learning new tricks and commands but for me at least to begin with most of them were more complicated than I needed for my simple usecase. Lots of options. Lots of knowing the package names on different distros. I'm just calling this cookbook *example*. That means the folder in the cookbooks folder is called example and the run list above references example. Feel free to change this to whatever you like, or create new cookbooks with different names. Inside that folder we create a recipes folder and inside that we create a default.rb file with the following content.

    package "curl"

And that's it. A bigish directory structure, three files, each with about one line of content. Simple.

Now to run all that just issue the following command:

    sudo chef-solo -c config/solo.rb -j config/node.json

This should output various messages to the console about what chef is doing and, when it's finished, you should find curl has been installed. Try and add another line to the recipe for another package (or even a gem) and rerun the chef-solo command. Now go read the docs for all the other cool things you can do.
