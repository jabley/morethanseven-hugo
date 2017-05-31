+++
date = "2017-05-26T13:56:00Z"
title = "Conference speaking as a software vendor"
url = "/2017/05/26/conference-speaking-as-a-software-vendor/"
+++

While reviewing 100s of proposals for upcoming conferences (Velocity EU and
PuppetConf) I tweeted [the
following](https://twitter.com/garethr/status/863780750927286273), which
seemed to get a few folks interest.

> I should write a blog post on "conference talk submissions for
> vendors/consultants". Rule one: own your bias

[This reply](https://twitter.com/dparzych/status/864217466389405696) in
particular pushed me over the edge into actually writing this post:

> Would love to hear advice, been told more than once a talk was rejected
> since I work for a vendor, even though my talk was not a pitch.

Writing something up felt like it might be useful to a few folks so here
goes. This is but one person's opinion, but I at least have some relevant
experience:

* I've worked for a software vendor for about 3 years
* Before that I worked for the UK Government, and before that various
  SaaS companies, in-house software teams and very briefly myself
* I've helped out on the programme committee or similar for a variety of
  events going back a bunch of years; Velocity, PuppetConf, Lisa,
  Devopsdays, QCon
* I've been lucky enough to speak at a wide range of events in lots of
  different places

Some of the following advice is pretty general, if you're interested in
speaking at software conferences (at least those I've seen or spoken at)
then hopefully much of this is relevant to you. But I also want to focus on
people working for a software vendor. I think that's particularly
relevant as more and more traditional vendors court the open source
community and software developers inparticular, and roles like
_developer evangelist_ see lots of people moving from more practioner
roles to work vendor-side.

## Learn to write a good proposal

My main experience with speaking at conferences, or helping curate
content, is via a call-for-proposals. The conference will have some
sort of theme or topic, set a date, and see what content is submitted.
There are a variety of oft-made points here about sponsoring to get a
talk slot, or submitting early, or approaching the organisers, but in my
experience the best bet is to write a really good proposal around a good
idea. That's obviously easier said that done, but it's not as hard as
you may think.

* Introduce the problem you're talking about, but don't make
  this the whole proposal.
* State in the proposal what you're going to talk about. Be specific.
  Don't say "an open source tool" when you mean a specific tool which
  has a name. Don't hide the details of the talk because you intend to
  reveal them when presenting.
* Include explicitly what the audience will do or be able to do
  differently after seeing the talk. Go so far as to say _"after this
  talk attendee will..."_
* Novelty really helps, as long as the topic is interesting and relevant.
  Given 100 proposals about deploying your web application with Docker,
  the one that says "and we do this for the International Space Station"
  is getting picked.
* If you know this is going to be a popular topic for other proposals
  then you also need to confince the CFP committee why you're the best
  person to present it.
* Liberally use bullet points. This might be a personal thing but if I'm
  reading 200+ proposals making it quick to read helps get your point
  across.

Unless you write a good proposal around an interesting idea, you probably
won't be accepted, whether you're a software vendor or not. Try get
feedback on your proposals, especially from folks who have previously
spoken at the event you're hoping to present at.


## Appreciate you're selling something

If you work for a software vendor your job is to sell software. Not
everyone likes that idea, but I think at least for the purposes of this
blog post it stands true. It doesn't matter if you're an evangelist
reporting into Marketing, or a software developer in Engineering or
anything else - you stand to gain directly or indirectly from people
purchasing your product. From the point of view of a conference, you are
thoroughly compromised when it comes to talking about your product
directly. This can be disheartening as you likely work at the vendor
and want to talk at the conference because you're genuinely interested,
even evangelical, about the product. You need to own that bias - there
really is no way around it.

If you work for a vendor, and the CFP committee even thinks the proposal
is about that product, you'll probably not be given the benefit of
doubt.


## And the answer is...

Probably the worst example of vendor talks that do sometimes get
accepted go something like this:

* Introduce a problem people can relate to
* Show some (probably open source) options for solving, focusing on the
  large integration cost of tying them together
* Conclude with the answer being the vendors all-in-one product

I think for expo events or for sponsored slots this approach is totally
valid, but for a CFP it bugs me:

* The proposal probably didn't explain that the the answer was the
  commercial product sold by the vendor
* The talk is unlikely to cover like-for-like competition, for instance
  it's probably not going to spend much time referring to direct
  commercial competitors
* As noted above, the presented is thoroughly biased, which doesn't make
  for a great conference talk

Please don't do this. It's a easy trap to fall into, mainly because you
hopefully genuinely believe in the product you're talking about and the
problem you're solving. If you really want talks like this try and
encourage your customers to give then - a real-world story version of
this is much more interesting.


## Talk about the expertise rather than the product

It's not all doom for those working for software vendors and wanting to
talk at conferences. The reality is that while you're working on a
discrete product you're also likely spending a lot of time thinking about
a specific domain. I spent a bunch of years using Puppet as a product,
but I've spent more time while working at Puppet thinking about the
nature of configuration, and about wildly heterogenuous systems. When I
worked for the Government I interacted with a handful of departments and
projects. At Puppet I've spoken with 100s of customers, and read trip
reports on meetings with others. Working for a vendor gives you a
different view of what's going on, especially if you talk to people from
other departments.

In my experience, some of the best talks from those working for software
vendors can be quite meta, theoretical or future facing. You have the
dual benefit of working in a singular domain (so you can do deep) and
hopefully having access to lots customers (so you can go broad).


## Talks as a product design tool

As someone working for a vendor, a big part of my job is designing and
building new features or new products. I've regularly found giving talks
(including the time taken to think about the topic and put together the
demos and slides) to be a great design tool. Assuming you're already
doing research like this, even in the background, pitching a talk on the
subject has a few advantages:

* It starts you writing for a public audience early in the design
  process
* The talk being accepted, and the feedback from the talk, provide early
  input into the design process
* The talk (or published slides) can encourage people thinking about
  similar things to get in touch

You can see this if you flick through talks I've given over the past few
years. For instance [What's inside that
container?](https://speakerdeck.com/garethr/whats-inside-that-container)
and more recently [Security and the self-contained unit of software](https://speakerdeck.com/garethr/security-and-the-self-contained-unit-of-software)
provide some of the conceptual underpinnings for
[Lumogon](https://lumogon.com/). And [The Dockerfile explosion - and the need for higher-level tools](https://speakerdeck.com/garethr/the-dockerfile-explosion-and-the-need-for-higher-level-tools)
talk I gave at DockerCon led to the work on [Puppet Image
Build](https://github.com/puppetlabs/puppetlabs-image_build).

These talks all stand alone as (hopefully) useful and interesting
presentations, but also serve a parallel internal purpose which
importantly doesn't exert the same bias on the content.


## Some good examples

The above is hopefully useful theory, but I appreciate some people
prefer examples. The following include a bunch of talks I've given at
various conference, with a bit of a rationale. I've also picked out a
few examples of talks by other folks I respect that work at software
vendors and generally give excellent talks.

A great topic for most vendors to talk about at suitable conferences is
how they approach building software. I spoke about [In praise of slow
(Continuous
Delivery)](https://speakerdeck.com/garethr/in-praise-of-slow-continuous-delivery)
at Pipeline conference recently, about how Puppet (and other vendors)
approach techniques like feature flags, continuous delivery and
versioning but for packaged software. That had novelty, as well as being
relevant to anyone involved with an open source project.

Probably my favourite talk I've given in the last year,
[The Two Sides to Google Infrastructure for Everyone Else](https://speakerdeck.com/garethr/the-two-sides-to-google-infrastructure-for-everyone-else)
looks at SRE, and infrastructure from two different vantage points.
This talk came directly from spending time with the container folks on
one hand, and far more traditional IT customers on the other, and
wondering if they meet in the middle.

Charity Majors is the CEO at Honeycomb and likes databases a lot more
than I do. The talk [Maslows Hierachy of Database Needs](https://speakerdeck.com/charity/maslows-hierarchy-of-database-needs)
is just solid technical content from an expert on the subject. Closer to
the Honeycomb product is this talk
[Observability and the Glorious Future](https://speakerdeck.com/charity/gluecon-2017-observability-and-the-glorious-future),
but even this avoids falling into the trap described above and stays
focused on generally applicable areas to consider.

Jason Hand from VictorOps has given a number of talks about ChatOps,
including this one entitled [Infrastructure as Conversation](https://speakerdeck.com/jasonhand/chatops-infrastructure-as-conversation).
Note that some of the examples use VictorOps, but the specific tool
isn't the point of the talk. The abstract on the last slide is also a
neat idea.

[Bridget Kromhout](http://bridgetkromhout.com/) works for Pivotal, the
folks behind Cloud Foundry amongst other things. But she invariably
delivers some of the best big picture operations talks around. Take a
couple of recent examples [I Volunteer as Tribute - the Future of Oncall](http://bridgetkromhout.com/speaking/2017/monitorama/)
and [Ops in the Time of Serverless Containerized Webscale](http://bridgetkromhout.com/speaking/2017/agile-technical/).
Neither talk is about a specific product, instead both mix big picture
transformation topics with hard-earned ops experience.

As a final point, all of those examples have interesting titles, which
comes back to the first point above. Make content that people really want
to listen to first, and if you're a vendor own your biases.
