---
comments: true
created_at: 2007/01/17}
date: 2007-01-17T00:00:00Z
title: Colorburnified
url: /2007/01/17/colorburnified/
---

<p>
If you visited the site previously since the Radiant move you might notice a new colour scheme. Come to mention it if you visit tomorrow, or the day after you should get a different colour scheme too.

</p>
<p>
I mentioned that I planned on a few experiments around these parts and this is the first one. I’m a big fan of <a href="http://www.firewheeldesign.com/widgets/">ColorBurn</a> from <a href="http://www.firewheeldesign.com/">Firewheel</a>. For those that haven’t seen it it’s a desktop widget that displays a new four colour colour scheme every day that looks a little something like:

</p>
<p>
<img src="http://morethanseven.net/_assets/media/imgColorBurn.jpg" alt="ColorBurn OS X Widget" />

</p>
<p>
I often use it for inspiration for colour sets, or just to appreciate interesting colour combinations. This just takes it a step further. A little reverse engineering and I have a script (PHP this time, running from a cron job) that writes out a new stylesheet once every day with the colours from ColorBurn (using the magic of XSL if you’re interested). I’ve used an alpha transparency on the image to the top left of the page which might result in strange effects in browsers that I dont care about too much. Sorry, but I did warn you.

</p>
<p>
I have a feeling that some days I’ll wake up and regret this experiment and others I’ll be pleasantly suprised. I’m not going to cheat either. ColorBurn provides me with four colours and the script will use them in the order they come in.

</p>
