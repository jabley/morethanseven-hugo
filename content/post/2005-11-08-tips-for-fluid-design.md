---
comments: true
created_at: 2005/11/08}
date: 2005-11-08T00:00:00Z
title: Tips for fluid design
url: /2005/11/08/tips-for-fluid-design/
---

<p>
After getting a few comments about the site design, and in particular a few of the fluid nature comments about it being tricky to get right. I’ve found myself tending to develop fluid designs more often that not over the <a href="http://thebgroup.co.uk">last</a> <a href="http://newcastlenewmedia.org">few</a> <a href="http://www.cravens.co.uk">years</a> and thought I’d do a short series of posts about some of the techniques I use. I’ve generally found it pretty easier to find <a href="http://www.boagworld.com/archives/2005/06/liquid_vs_fixed.html">discussions</a> about the <a href="http://www.digital-web.com/articles/fluid_thinking/">pro’s</a> and <a href="http://9rules.com/whitespace/design/death_of_liquid_layouts.php">cons</a> and the basic principles but less so on actual techniques. I’ll try cover some or all of the following over the next few weeks or so:

</p>
<ul>
<li>
extendable background images

</li>
<li>
using overflow hidden

</li>
<li>
use of fluid flash banners

</li>
<li>
min-width and max-width (and javascript)

</li>
</ul>
<p>
I’ll kick off with tricks for background images.

</p>
<p>
This techniques makes extensive use of the <em>background</em> <acronym title="Cascading Style Sheets">CSS</acronym> property which is used as following: <em>div\#iBackground { background: url(path/to/image) center top no-repeat; }</em>

</p>
<p>
I’ll assume some familiarity with this and CSS in general, basically all we are doing is setting a background image to the div with an id of iBackground which is set to align to the top vertically and centered horizontally.

</p>
<p>
Moving the image to the background has a couple of interesting effects, the one that we are interested in here is that the the size of the div is not affected by the size of the image (as it would be if the image was placed inside it). It acts as a kind of viewport into the world of the image. By specifying the width of the div in percentages (or em’s if you are dealing with an elastic design) the size of the viewport can change dependent on the size of the browser window. An example is inorder:

</p>
<p>
<a href="http://joshuaink.com">joshuaink.com</a> makes use of a large background graphic that stretches the full width of the site. This means the space can be used for pretty large imagery but without breaking the experience (sideways scrolling!) for those with lower resolution displays. Note that the flower background is 2000px wide.

</p>
<p>
The only problem with this technique that I have come across is generating the images in such a way that they degrade gracefully. You need to make sure real <em>content</em> (logos or text) appear in a smaller area that the whole image and live with the fact that not everyone is going to see the whole thing. In my mind this is a small price to pay for asthetically interesting fluid layouts.

</p>
