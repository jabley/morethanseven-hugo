---
comments: true
created_at: 2007/06/22}
date: 2007-06-22T00:00:00Z
title: Encoded Characters in CSS3 Generated Content
url: /2007/06/22/encoded-characters-in-css3-generated-content/
---

A quick, but hopefully informative post on something that took me a little time to work out and I thought might trip a few others up too.

I'm playing with quite a bit of CSS3 at the moment for our [new company](http://hedgehoglab.com) site. It seemed like a good excuse to put into practice lots of progressive enhancement and the like and so far is going nicely if I do say so my self.

The [CSS3 Generated Content Module](http://www.w3.org/TR/css3-content/) has some nice little bits in and I decided to use it to put some icons after external link ala wikipedia (but with nicer icons). Actually what I wanted was simply an arrow and I didn't really need an image for that did I?

Well my first try went a little something like this:

    <code>p a[href^="http:"]:after {
        content: "#8594;";
    }</code>

Nope, no luck. By the time it hits the browser it's not what I was looking for. I didn't think old style named entities would work but what the heck?

    <code>p a[href^="http:"]:after {
        content: "&rarr;";
    }</code>

Nope. As I thought. No luck their either. I also tried the character itself (but forgot to put that in the first post - thanks [Joe](http://joeclarke.org/weblogs/)) but again to no avail.

    <code>p a[href^="http:"]:after {
        content: "â†’";
    }</code>

Some digging around and I managed to infer the correct syntax from some hidden away examples about something else.

    <code>p a[href^="http:"]:after {
        content: "\2192";
    }</code>

You need to use the Unicode encoding. Doh. Job done.
