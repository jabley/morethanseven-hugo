---
comments: true
created_at: 2006/09/26}
date: 2006-09-26T00:00:00Z
title: Niche job boards and hot skills
url: /2006/09/26/niche-job-boards-and-hot-skills/
---

<p>
The growth of niche job boards took another jump today with the launch of <a href="http://authenticjobs.com/">Authentic Jobs</a> by <a href="http://www.cameronmoll.com/">Cameron Moll</a>, following on from the job boards over on <a href="http://jobs.37signals.com">37signals</a> and <a href="http://jobs.joelonsoftware.com">Joel on Software</a>.

</p>
<p>
I find all this pretty interesting, not because I’m looking for job (I’m not), but more from a social research point of view. It’s the whole <a href="http://www.wired.com/wired/archive/12.10/tail.html">long tail</a> thing again, and it will be intersting to see if these things take off in other, shall we say, less geeky circumstances. Niche job boards for the building industry for instance? or insurance?

</p>
<p>
This source of focused data also gave me a chance to play with Python as a data mining tool, something I’m finding it amazingly well suited to. My background was in experimental design and analysis so I’m something of a number crunching fan deep down.

</p>
<p>
The scripts are simple and have no niceties like error handling or comments so I’m not going to post them unless someone really wants them or I get chance to clean them up. Safe to say I used the outstanding <a href="http://www.feedparser.org/">Universal Feedparser</a> module from <a href="http://diveintomark.org">Mark</a> for most of the heavy lifting.

</p>
<p>
Brief methodology was to grab the complete feeds from the three sites mentioned and dump all the contents to a file, sans markup and lowercased. I then parsed them for a short list of words – in this case programming languages and counted the results.

</p>
<p>
Well, here are a few of the tidbits of info I pulled out. This is only the start obviously, more time may mean more detailed (and accurate) research ideally with a time element thrown in.

</p>
<ul>
<li>
C** – 137

</li>
<li>
Java – 128

</li>
<li>
PHP – 110

</li>
<li>
Javascript – 90

</li>
<li>
C\# – 74

</li>
<li>
Flash – 52

</li>
<li>
Ruby – 43

</li>
<li>
Python – 40

</li>
<li>
Rails – 32

</li>
<li>
Actionscript – 11

</li>
</ul>
<p>
This I found interesting. The old school (C** and Java) might not be <em>hot</em> but their certainly seems to be a need for good programmers. Javascript being up their is <a href="http://www.quirksmode.org/blog/archives/2006/09/sxsw_panel_java.html">probably to be expected</a> but strange non the less, given where it would have been a year ago.

</p>
<p>
This obviously has myriad problems; your unlikely to use the <em>word</em> C\# in a description unless your talking about programming, but you might use the word flash) and was weighted towards the <a href="http://jobs.joelonsoftware.com">Joel on Software</a> site as that both had much longer descriptions and lots more elements in the feed. Nothing about density either, so someone writing Java, Java, Java would skew the results. If I do some proper research and write it up you could get around most of these easily enough.

</p>
<p>
Anyone know of other niche job boards around so far? I’d be interested to have a look. I have a feeling recruitment is heading towards the same fate as advertising; where online advertising models are increasingly making the the old <em>do work for free and charge a percentage on the backend</em> ways nearly unworkable.

</p>
