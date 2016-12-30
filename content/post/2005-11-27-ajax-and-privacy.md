---
comments: true
created_at: 2005/11/27}
date: 2005-11-27T00:00:00Z
title: AJAX and Privacy
url: /2005/11/27/ajax-and-privacy/
---

<p>
Ok, so everyone by now has no doubt had a play with <acronym>XML"&gt;AJAX</acronym> in some shape or form, and their are lots of good <a href="http://rajshekhar.net/blog/archives/85-Rasmus-30-second-AJAX-Tutorial.html">tutorials</a> and <a href="http://dhtmlnirvana.com/ajax/ajax_tutorial/">articles</a> around. I’m not going to add to the pile, but on my travels I did do something that raised a couple of questions. Let me know if anyone has any answers.

</p>
<p>
The questions are more ethical than technological however and came about when considering online advertising and it’s never ending need for metrics – at the moment that generally means impressions and click throughs (maybe also including converting click throughs). These two states are imposed to some extent by the stateless nature of most web pages. We can tell what gets shown to the visitor. But they then disappear from our radar until they do something – in this case click on an advert (or dont).

</p>
<p>
But what about the asynchronous nature of our new toy AJAX? We are starting to break out from the constrains of the stateless web so can anything be added to our add example? Why yes of course it can.

</p>
<p>
I’ve set up a quick working example that should hopefully make my point a little clearer. Open in a new tab (I know 80% of you can – <a href="http://haveamint.com">mint</a> is great) if you will – <a href="http://morethanseven.net/monitor">morethanseven.net/monitor</a>

</p>
<p>
Mouse over the two <em>Ad</em> areas a few times. Click on them a few times too. Obviously the appearing message telling you what you have done is hardly exciting but it’s actually a response from an AJAX (actually it’s not returning XML so is that AJ?) call. All the call does is log the action inn a text file and return a success or failure. This isn’t high tech stuff – it’s proof of concept remember, it gets interesting a couple of jumps forwards.

</p>
<p>
The two buttons at the bottom, clear log and view log, allow you to see the log of actions (and delete them). I dont imagine this attracting high but the log file will log everyone’s actions not just yours, so you might want to clear the log first to more easily see your actions appear.

</p>
<p>
OK, so what? Well lets imagine instead of just the actions I log your IP address, some date details, maybe store a cookie on your computer while I’m at it. Also as well as hooking up two add areas as in the example I hook up <em>everything</em> on the page. Not only can I build up a picture of your activities between pages (your path through the site), I can build up a picture of what your mouse was doing on a given page. Now where stalking.

</p>
<p>
OK, so I’m not sure if their is a correlation between a web users mouse pointer and what they intend but think of other examples – I could trigger the events on focus for form elements. You might get half way through registering or purchasing (you’ve entered your name and an email address) and then decide against it. Normally all I’d be able to get would be someone went to the page in question and did not complete the required actions – with AJAX I could log who you where and were you got to in the process (and then email you to ask why).

</p>
<p>
Ethics anyone? Anyone else see problems? Let me know.

</p>
<p>
<em>Note. The javascript examples are not great and I’ve testing in recent versions of IE and Firefox only. It’s a proof of concept rather than tutorial.</em>

</p>
