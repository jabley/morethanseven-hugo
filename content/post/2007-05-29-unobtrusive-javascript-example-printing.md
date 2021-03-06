---
comments: true
created_at: 2007/05/29}
date: 2007-05-29T00:00:00Z
title: Unobtrusive Javascript Example - Printing
url: /2007/05/29/unobtrusive-javascript-example-printing/
---

In lieu of some real posts here's a quick code sample to keep things ticking along.

I'm sure you've had the need to place a nice print button on a web page from time to time. If you haven't you're probably alone. A quick google will throw up lots of results for print javascript - the problem is that most of them are horribly obtrusive.

OK, so it's easy to write something like:

    <code><a href="#" onclick="window.print();">print</a></code>

But the problem is *What if you turn off javascript?* The following unobtrusive script automagically adds a print link to the page - in this case as part of a list item which is added to the unordered list with the id of *iNav* and a class of *has-print*.

    <code>var Print = {
       init: new domFunction(function() {
          if (list = document.getElementById("iNav")) {
             if (list.nodeName.toLowerCase() === 'ul') {
                if (Print.hasClass(list,'has-print')) {
                   var item = document.createElement("li");
                   item.className = "print";
                   var link = document.createElement("a");
                   link.href = "#";
                   link.onclick = Print.printpage;
                   var txt = document.createTextNode("Print");
                   link.appendChild(txt);
                   item.appendChild(link);
                   list.appendChild(item);
                }
             }
          }
       }),

       hasClass: function(element,cName) { 
          return new RegExp('\\b'&#43;cName&#43;'\\b').test(element.className);
       },

       printpage: function() {
          window.print();
          return false;
       }
    }</code>

With something like this you want it to load as soon as the dom is ready, rather than on page load. [Brothercake's](http://www.brothercake.com) [domFunction](http://www.brothercake.com/site/resources/scripts/domready/) comes to the rescue here. The namespacing is based on [Stuarts](http://www.kryogenix.org) technique which should make it more capable of just being dropped in to any site.

The only problem with this is that it's just a little longer than the original. I think this is down to one often missed fact, at least until recently - Javascript is a programming language and should be treated as such.
