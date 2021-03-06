---
comments: true
date: 2012-12-03T00:00:00Z
title: On the forge
url: /2012/12/03/on-the-forge/
---

I've been spending a bit of time recently pushing a few Puppet modules to the [Forge](http://forge.puppetlabs.com). This is Puppetlabs attempt to make a central repository of reusable puppet modules. I started doing it as a bit of an experiment, to find out what I liked and what worked and I decided to writeup a few opinions.

So far I've shipped the following modules:

-   [Riemann](http://forge.puppetlabs.com/garethr/riemann)
-   [Graphite](http://forge.puppetlabs.com/garethr/graphite)
-   [Logstash](http://forge.puppetlabs.com/garethr/logstash)
-   [Freight](http://forge.puppetlabs.com/garethr/freight)

Quite a few of these started as forks of other modules but have evolved quite a bit towards being more reusable.

I've also started sending pull requests for modules that basically do what I want but don't always play well with others.

-   [Redis](https://github.com/thomasvandoren/puppet-redis/pull/10)

Improved tools
--------------

It turns out the experience is mainly a pleasurable one, partly down to the much improved tooling around Puppet. Specifically I'm making extensive use of:

-   [Rspec Puppet](http://rspec-puppet.com/) - for writing tests for module behavious
-   [Librarian Puppet](https://github.com/rodjek/librarian-puppet) - dependency management for modules
-   [Puppet spec helper](https://github.com/puppetlabs/puppetlabs_spec_helper) - conventions and helpers for testing modules
-   [Travis CI](https://travis-ci.org/) - easy continuous integration for module code
-   [Vagrant](http://vagrantup.com/) - manage virtual machines, useful for smoke testing on different distributions

Lots of those tools make testing Puppet modules both easier and useful. Here's an example of one of the above modules being tested. Note that it's run across Ruby 1.8.7, 1.9.2 and 1.9.3 and Puppet versions 2.7.17, 2.7.18 and 3.0.1 for a total of 9 builds. Handily the Redis module mentioned also had a test suite. The pull request includes changes to that, and Travis [automatically tested the pull request](https://travis-ci.org/thomasvandoren/puppet-redis/builds/3462513) for the modules author.

Antipatterns
------------

Using modules from the Forge really forces you to think about reusability. The pull request mentioned above for the Redis module for instance replaced an explicit mention of the build-essential package with the "puppetlabs/gcc": class from the Forge. This makes the module less self contained, but without that change the module is incompatible with any other module that also uses that common package. I also went back and replaced explicit references to wget and build-essential in my Riemann module.

As a rule of thumb. For a specific module only include resources that are unique to the software the module manages. Anything else should be in another module with a dependency in the Modulefile.

This can feel a little much when you're replacing a simple Package resource with a whole new module but it has two advantages I care about. As well as the ability to use the module with other third party modules more easily it also makes it more likely that the module will work cross platform.

What's missing?
---------------

I'd like to see a few things improved when it comes to the Forge.

-   I'd like to be able to publish a new version of a module without having to use the web interface. The current workflow involves running a build command, then uploading the generated artifact via a web form after logging in.
-   I'd like to see best practice module development guides front and centre on the Forge. Lots of modules won't work with other modules and I think that's fixable.
-   Integration with puppet-lint would be nice, giving some indication of whether the authors care about the Puppet styleguide.
-   ~~A command line search interface would be useful~~. And [turns out to exist](http://docs.puppetlabs.com/man/module.html). Thanks [@a1cy](http://twitter.com/a1cy) for the heads up.
-   The Forge tracks number of downloads, but as a publisher I don't know how often my modules have been downloaded.
-   And finally I'd like to see more people using it.
