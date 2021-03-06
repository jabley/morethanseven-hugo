---
comments: true
created_at: 2008/10/11}
date: 2008-10-11T00:00:00Z
title: Google App Engine PyUnit Test Runner
url: /2008/10/11/google-app-engine-pyunit-test-runner/
---

I'm starting to play around with using [App Engine](http://code.google.com/appengine/) again for small projects. It's great for simple, somewhat throwaway apps as long as you don't need anything too fancy. Actually all I want really is long running processes but I digress.

I'm increasingly writing test suites as well for even small projects and was missing the convenience of the Django test runner for running them against App Engine code. So I've spent a little time writing a simple test running script to use for non-Django Python projects. I've posted it over on the [App Engine Cookbook](http://appengine-cookbook.appspot.com/recipe/app-engine-test-runner/) for anyone else who might want to do the same.

I ended up writing something myself as I couldn't find anything else which quite met my needs, so it's the typical programmers itch code and as such is provided as *works for me* software. The other approaches out their didn't quite meet my needs but might be useful to know about if you want to start testing your apps.

-   [Nose GAE](http://code.google.com/p/nose-gae/) uses the nose testing framework which I'm less familiar with.
-   [GAE Unit](http://code.google.com/p/gaeunit/) uses PyUnit but presents it's results in a browser rather than on the command line.
