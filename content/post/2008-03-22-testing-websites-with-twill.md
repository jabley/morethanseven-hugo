---
comments: true
created_at: 2008/03/22}
date: 2008-03-22T00:00:00Z
title: Testing Websites with Twill
url: /2008/03/22/testing-websites-with-twill/
---

I've been playing with [Twill](http://twill.idyll.org/) a little recently. It's a Python based DSL used for functional testing of websites. From the official website:

> Twill is a simple language that allows users to browse the Web from a command-line interface. With twill, you can navigate through Web sites that use forms, cookies, and most standard Web features.

A simple example might make things clearer. You'll need to install twill first - the instructions are available on [the site](http://twill.idyll.org/). We can write tests directly into the shell so we'll start their. For our first test we'll write one that will hopefully fail - a test to check whether this website is down.

    <code>twill-sh
    >> go http://morethanseven.net
    >> code 404</code>

First we fire up the twill shell then enter two simple commands. The first command, *go*, sends the browser to the specified URL. The second command is an assertion, in this case a check on the HTTP status code. If this website is available then it should return the HTTP code 200, if it's unavailable then it will probably return a 404 Not Found. This test will hopefully fail, indicating that this website is up and running. In reality you're more likely to test for the 200 status code and fail on anything else but for this example it's useful to see what a failing test looks like.

Although pretty powerful the twill scripting language is nice and small. I've listed most of the commands below just to give you an idea of the sort of things that you can get up to. You can type *help* at the twill shell to get more information on the available commands and the individual commands themselves.

-   twill-sh
-   twill-sh {filename}
-   twill-sh {filename1} {filename2}
-   twill-sh -u {url} {filename}
-   twill-sh -n {filename}
-   go {url}
-   show
-   save\_html {file-name}
-   showlinks
-   showforms
-   follow {url|url-name}
-   back
-   reload
-   showhistory
-   echo {variable}
-   formvalue {form} {input} {value}
-   submit {input}
-   show\_cookies
-   save\_cookies {file-name}
-   load\_cookies {file-name}
-   clear\_cookies
-   code {code}
-   url {text}
-   title {text}
-   find {text}
-   setglobal {name} {value}
-   setlocal {name} {value}
-   debug http 1
-   redirect\_output {file}
-   redirect\_error {file}
-   agent {ie5|ie55|ie6|opera7|konq32|saf11|aol9}
-   add\_auth {realm} {url} {user} {password}
-   runfile {file-name}
-   extend\_with check\_links
-   check\_links
-   check\_links {regex}
-   twill-fork -n {number} -p {processes} {script}

You can also store tests in individual files as well as run a batch of tests at once. I have a couple of tests that I can run against any URL which might be a useful starting point for anyone else starting to look at testing their sites or applications. You can [download these tests here](http://morethanseven.net/_assets/downloads/twill/twill.zip).

If you unpack the zip archive and then open the folder in a terminal or console. You can then run all of the tests like so, note we're passing the starting URL into the scripts which makes using the same scripts for multiple sites easier.

    <code>twill-sh * -u http://morethanseven.net</code>

The tests included do a few things; from checking for the presence of several required markup elements and checking for an XHTML doctype to checking that all the links on the page are working.

All these examples are pretty simple and non-site-specific. For more complex form based applications you can write application browsers which fill out forms, create user sessions and do everything a user might do. Twill is also particularly useful when it comes to testing RESTful webservices with all the URLs and HTTP status codes floating about.
