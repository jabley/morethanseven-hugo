---
comments: true
created_at: 2008/04/11}
date: 2008-04-11T00:00:00Z
title: 'DSLs for HTML and CSS - The Future, or Just Plain Wrong? '
url: /2008/04/11/dsls-for-html-and-css-the-future-or-just-plain-wro/
---

After my previous post about [Django and the web standards community](http://morethanseven.net/posts/why-the-webstandards-world-appears-to-be-choosing-django/) a number of the comments picked up on the fact I mentioned [haml](http://haml.hamptoncatlin.com/) under the title *Other Craziness*. Ok, so I was being a little over-poetic but I decided this warranted a closer look.

Haml is a markup language that's used to cleanly and simply describe the XHTML of any web document without the use of inline code. Haml functions as a replacement for inline page templating systems such as PHP, ASP, and ERB, the templating language used in most Ruby on Rails applications.

A quick example should help. The following haml code...

    <code>%div.special#primary Hello, World!</code>

...is compiled to the following HTML:

    <code><div class="special" id="primary">
      Hello, World!
    </div></code>

Depending on your application this could be at runtime or as part of a build step. Although primarily associated with Rails because haml is also available as a command line utility you could in theory use it with any framework or language.

My initial take on this was to call haml an abstraction of HTML but [Nathan Weizenbaum](http://nex-3.com/), one of haml's developers, put me straight:

> Haml doesn't really abstract HTML. Not in the same sense that, say, Rails helpers do. Since Haml has a one-to-one mapping to HTML, I view it more as an alternate syntax for HTML than an abstraction.

Lots more examples for anyone interested can be found on [the haml documentation site](http://haml.hamptoncatlin.com/docs/).

After some research and some playing around with the command line version of the haml engine I decided to see what Twitter thought about the situation. Little did I realise what I was letting myself in for:

[Tom Morris](http://tommorris.org/) kicked things off:

bq.:http://twitter.com/tommorris/statuses/784959480 I'm not sure why everyone insists on clumsily reinventing HTML every few weeks (eg. wiki syntaxes, of which there are hundreds)

[Brad Wright](http://intranation.com/) thought:

bq.:http://twitter.com/intranation/statuses/784963589 Sass is just stupid, since you're basically writing **exactly** the same CSS just in shitty YAML style.

And followed with:

> What's the point of abstracting HTML? It's not that hard

And [Mark Norman Francis](http://cackhanded.net) chipped in with:

> EVIL. And not in a good, kittenish way.

A few people echoed [Ross Bruniges](http://thecssdiv.co.uk/) sentiment that haml and sass are just:

bq.:http://twitter.com/rossbruniges/statuses/784954916 front-end code for those who don't really care all that much about it and would rather create databases

I have to admit to this being my initial reaction on hearing about and looking at haml, hence the remark from the previous post. But that's not to say everyone was negative.

[Mike Stenhouse](http://donotremove.co.uk/) stepped in and said:

bq.:http://twitter.com/mikesten/statuses/784952890 Love haml - it's all I use these days. More readable, dynamic and hackable. Took me a while to come around to it though...

Some of the comments were about how the use of haml might alter the dynamic of a team, to either positive or negative effect - depending on your point of view.

[Mark Ng](http://www.markng.co.uk/) saw it as a cunning way of getting rid of the front-end guy.

bq.:http://twitter.com/markng/statuses/784952935 at first, they look elegant. Then it becomes obvious how they remove designers from the process of making markup.

Where as [Olly Hodgson](http://thinkdrastic.net/) say it maybe as a route to get the dyed in the wool back-end writing decent markup.

bq.:http://twitter.com/OllyHodgson/statuses/784957324 They look interesting. With proper training it might be a good way to get back-end programmers creating decent HTML (shock horror!)

At present haml is very much pitched at the Rails community from whence it came. Many of the examples demonstrate benefits compared to ERB, and haml is of course written in Ruby and available as a Rails plugin. Being perceived as part of that community has obvious benefits but also some subtle costs, in particular regarding those people that don't like Rails very much.

I'm not really convinced of the benefits in all fairness. The *something else to learn* barrier only gets magnified when working within a team environment. You now have to train new recruits of whatever skill level in another syntax. One that they might be able to write quickly enough but can they understand from the briefest of glances at a template? HTML might not be great here but it is familiar to everyone. Their is also the programmers abstraction. What if I can't get the markup I want out the other side of the black box? Yes it's open source so I can hack the box open but that causes even more problems. And while I quite like meaningful whitespace (for instance in Python), in templates which fail if it's not quite right I see a major problem for those whom a text editor is not their best friend.

I am however interested to see whether the problems people have with haml are with haml in particular or with the overall approach of alternative syntax's for HTML and CSS. Are DSLs (Domain Specific Languages) needed for CSS and HTML? and if so is this a possible avenue for innovation on top of slow moving standards?
