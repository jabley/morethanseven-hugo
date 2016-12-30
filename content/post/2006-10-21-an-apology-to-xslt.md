---
comments: true
created_at: 2006/10/21}
date: 2006-10-21T00:00:00Z
title: An apology to XSLT
url: /2006/10/21/an-apology-to-xslt/
---

<p>
I have to admit to thinking that XSL was something of a waste of time a while back. I’ve changed my mine and wanted to muse about why.

</p>
<p>
XML is simple enough to jump right in, and a few years back it had a big enough band wagon to mean jumping on was pretty much required. I think in hindsight, at least in my mind, alot of this was just a little gratuitous. XML abstraction layers, XML content management systems, SOAP, etc.

</p>
<p>
I’d often seen XSLT as the template layer in an XML based content management system and after several looks went back to using light weight systems that made sense. The idea of going from a database to XML then outputting HTML via XSLT just made me wonder why. The rationale that you could then output it as anything (WML, PDF, whatever) was very nice, but rarely actually realised from what I saw, and easy enough to do with any half decent templating system. You also always seemed to need more XSLT that it looked like you should.

</p>
<p>
<a href="http://rubyonrails.org">Ruby on Rails</a> even wore as a badge of honor that it didn’t need to do any XML pushups to deal with configuration. And even those with a penchant for Java seem to have problems with using <a href="http://www.sdtimes.com/printArticle/column-20060901-05.html">XML as a programming language</a>.

</p>
<p>
Of late though I’ve been back playing with APIs, many of which produce XML in one way or another (whether that’s RSS, Atom or some custom format), and XSL actually comes in pretty handy here for just thowing around content. I did some work with a <a href="http://mini.google.co.uk">Google Mini</a> too using XSLT and their are some <a href="http://suda.co.uk/projects/X2V/">interesting tricks</a> with <a href="http://microformats.org">Microformats</a> to boot. I haven’t listened to the <a href="http://muffinresearch.co.uk/wsg/audio/index.xml">podcast</a> yet so I’m just guessing at the moment but I could see <a href="http://allinthehead.com/">Drew’s</a> “Your website as your API” talk at the <a href="http://muffinresearch.co.uk/archives/2006/10/21/following-the-wsg-microformats-event/">recent WSG meeting</a> making use of XSLT?

</p>
<p>
So, I think I might have changed my mind a bit. XSL, I think, is going to be a useful skill to have in your toolkit in a world of microformats and APIs. The <a href="http://www.w3schools.com/xsl/">W3Schools XSL tutorial</a> is a pretty good starting place if you’ve not used it previously at all. Thought I’d still rather use a <a href="http://www.cheetahtemplate.org/">decent templating engine</a> for site rendering tasks.

</p>
