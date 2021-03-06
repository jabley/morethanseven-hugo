---
comments: true
created_at: 2007/01/24}
date: 2007-01-24T00:00:00Z
title: URI Templates in the Real World
url: /2007/01/24/uri-templates-in-the-real-world/
---

<p>
I do quite a bit of big picture web site/application design at work (ok, that probably needs more of a description). I get involved in alot of the details that lie somewhere off to the side of the obvious bits that need to be done (mmm, not much better). All those technologies and tools and ideas only tell part of the story of building a successful site or online application. Even something stringing together a good idea, clean markup, good CSS, some fancy backend code (insert prefered option) and a sprinkling of user centred design tools can fall down on the hidden details; good form labels, help messages that actually help rather than just repeating the problem, organising file systems to allow for simple scaling, skinning and internationalisation, etc.

</p>
<p>
<a href="http://plasticbag.org">Tom Coates</a> spoke last year about his concept of <a href="http://www.plasticbag.org/files/native/">Native to a Web of Data</a> which really struck a chord at the time, and not just because I still want <a href="http://www.flickr.com/photos/redux/97126279/">this on a t-shirt</a>. More recently the idea of <a href="http://en.wikipedia.org/wiki/REST">REST</a> has really caught on, especially amongst the dynamic languages crowd – you just need to look at Rails 1.2 for an example their. The big picture is <a href="http://www.faqs.org/rfcs/rfc2616.html">HTTP</a> is back and everyone who didn’t already get it should be doing some reading.

</p>
<p>
Another notable person talking quite a bit about REST, HTTP and related issues is <a href="http://bitworking.org">Joe Gregorio</a>. Amongst other interesting posts, I came across one on <a href="http://bitworking.org/news/URI_Templates">URI Templates</a> a good while ago and have been following the specification to produce recent documentation. The idea is simple and so is the <a href="http://bitworking.org/projects/URI-Templates/draft-gregorio-uritemplate-00.html">specification</a>. A quick example, for a simple CRUD interface might be:

</p>
<table>
<tr>
<th>
Action

</th>
<th>
URI

</th>
<th>
Method

</th>
</tr>
<tr>
<td>
View

</td>
<td>
/view/{id}

</td>
<td>
Get

</td>
</tr>
<tr>
<td>
Add

</td>
<td>
/page/add

</td>
<td>
Get, Post

</td>
</tr>
<tr>
<td>
Edit

</td>
<td>
/page/edit/{id}

</td>
<td>
Get, Post

</td>
</tr>
<tr>
<td>
Delete

</td>
<td>
/page/delete/{id}

</td>
<td>
Post

</td>
</tr>
</table>
<p>
Doing this for a site or application in the early stages of development really helps to highlight what actions are available, and to remove the need for costly changes later in the day. It also helps others learn, mainly through discussion, about the different HTTP methods and the importance of the URI in general.

</p>
