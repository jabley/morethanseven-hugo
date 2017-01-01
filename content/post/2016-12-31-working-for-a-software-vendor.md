+++
date = "2016-12-31T14:37:50Z"
title = "Working for a software vendor"
+++

One of the reasons I moved to Puppet two and a bit years ago was because
I was interested in the software industry. In particular I was
interested in being on the vendor side for a while. My background is
mainly as a service provider, software as a service, in-house
developer/ops type person. This has definitely been an interesting
experience, but I've not tried too much to explain _why_, until now.

First, what do we mean by _vendor_?

> a person or company offering something for sale, especially a trader
> in the street.

So in the context of a software vendor we specifically mean:

> a person or company offering software for sale

Note that we're selling the software, not access to some service
provided by software (ie. SaaS). SaaS and other as-a-service models are
growing part of the industry, but the business model, development cycle,
company structure and other aspects are quite different in my experience,
though lots of hybrid models exist too.


## Economics and scale

One of the interesting aspects of the software vendor world is the
economics, the revenues, and the fact lots of companies are public. This
in turn means a large amount of VC money goes into trying to create
another large software vendor, because the potential payout is huge.

Take a sample set of companies from the last 10 years or so that are still
private: Docker, Puppet, Chef, MongoDB, Elastic, CoreOS, Mesosphere,
Weave, Cloudera, etc. Somewhat biased towards my own interests I'll
admit.

Now take a sample of large, public, software vendors: Oracle, Microsoft,
CA, SAP, Sage, BMC, VMware. Not counting companies like Intel,
Cisco, IBM, Dell (no longer public), and HP with huge software portfolios.

Let's pick on Sage, a UK software company selling accounting software.
[As of 2014](http://www.truffle100.com/2015/ranking.php) Sage had 1169
people in software development R&D roles and they made $1.6billion from
software and related services in 2015. That's probably about the (order
of magnitude) number of people employed in R&D roles in the above private
softare companies. The revenue is (and I'm guessing here) a bit higher
at Sage than those companies combined too. SAP is an order of magnitude larger,
both in terms of people (18908 in 2014) and revenues ($18billion
also in 2014). Oracle revenues were $38billion as another data point.

So all the cool (or not so cool) companies from the past 10 years or so
are a rounding error to the size of the industry. But you wouldn't know
that from reading Hacker News or other parts of the internet. This
disconnect is a constant source of interest to me as I spend time with
Puppet customers and with the wider infrastructure community at
conferences and the like.


## A world of difference

My gut feeling is that most people working as software developers,
designers, product managers, etc. don't work for software vendors. Apart
from maybe in localised areas like Silicon Valley. But because of the
mentioned money and scale (and PR spend) of the big players a
great deal of press interest centers around vendors. Docker is probably the
best current example of this but it's more general than one company.
This makes what happens in software-vendor-startup-land more visible to
everyone else than, say, IT reality in large financial companies.

At the heart of a good software company is a product being
built and maintained by a team of engineers, designers, managers, etc.
In many ways this is similar to lots of peoples experience of building
software (whether at work or at home as part of one open source project
or another). But the support surrounding this tends to vary greatly from
other areas. A dedicated marketing and product marketing team, dedicated
sales staff, a professional services function, training, documentation,
public relations personell are all required to turn the software into
revenue. And importantly these teams have to work closely together, and
be actively involved with the development of the product.

This is very different from an in-house development position, but it's
also quite different from most SaaS operations. SaaS tends (generalising
here) to be based around large numbers of individual users with monthly
recurring revenues of 10s or 100s of US dollars. Software vendors
selling to large enterprises tends to be looking at single large deals
of 10s of thousands to many millions of dollars. This tends to mean
large differences in total number of customers, revenue per
customer, time needed to close a deal, requirement for staff local to a
customer, etc. All of that makes for a very different operation and
feedback cycle.


## Some interesting observations

Software has a much longer shelf-life in the real-world than people
typically think on the internet. Take the datacenter automation
market. [This IDC
report](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/products/vrealize-suite/vmware-idc-worlwide-datacenter-automation-software-market-shares-2015.pdf)
for example pegs the market at $2.3billion in 2015. VMware takes the
lions share with roughly 30%, with BMC with 10%. For reference Puppet
has 3.2% and Chef 1.2%. Obviously this is just one report, and it's now
a year old, but it's an interesting data point. And compare that to what
you might expect if you just follow the software rather than the market.
Even in 2015 some people would have been saying "surely everything is
Docker and Kubernetes now?". The reality is closer to it being all shell
scripts and BladeLogic for the majority of IT shops.

For the most part, innovators (and some early adopters) don't buy software,
instead they build or co-opt it. Take Netflix, Uber, Amazon, Google,
Facebook or similar. All are well-known for building much of there core
software and infrastructure and using open source solutions for much of
the rest. And it's not just software, all of the above also have large
internal investments in bespoke hardware as well. So who buys software
from software vendors? Taking the [Rogers' Innovation Adoption
Curve](http://www.valuebasedmanagement.net/methods_rogers_innovation_adoption_curve.html)
it's the early majority, the late majority and laggards. That's
~85% of the market. Most of the noise on the internet about software is
from innovators and early adopters, or people who want to be in those
groups. But most of the software sold is to people with very different
wants and needs. This chasm explains much of the frustration experienced
with software, and the difficulty of building software for often very
different types of users at the same time.

Much of the writing about continuous delivery and continuous deployment
assumes you're releasing a web site or at least a central, single,
service. At the very least this is most peoples experience and context.
But shipping software than people install and run themselves tends to
make software deployment a pull rather than a push. A vendor can release
a new version, but how to make the customer upgrade? Technically this
could be reasonably straightforward (Chrome auto-updates for example)
but for expensive, often critical, systems in sometimes regulated or
otherwise controlled or low trust environments, this turns out to be
trickier and more about people than just technology. This is an entire
topic on it's own so I'll leave it there [for
now](https://web.pipelineconf.info/).

Continuous integration for packaged software (true for some, but not most,
projects outside software vendors) tends to hit a permutation explosion quite
quickly. Take server software because that's what I'm most familiar
with. You'll definitely support the latest version of RHEL, plus
probably a few older versions, and maybe Centos and some of the other
variants (Oracle Linux, Scientific Linux) as well. Ubuntu LTS releases
probably makes the list, as might Debian stable. You'll also likely want
to test on at least Windows Server 2016 and 2012. You may have need to
keep going and support BSD, AIX, HP-UX, SUSE, etc. [Puppet has an
unreasonably long list of supported and tested
platforms](https://docs.puppet.com/guides/platforms.html) for instance.
Throw in other variations or configurations or architectures and you
have a serious CI environment. Compare this to a more typical case of a
deployment pipeline to a single known operating system and version on
a server you control.


## Open source

One of the notable things about the lists above of older (public) and
newer (currently private) software companies is that all of the newer
ones are based around an open source software product or products. We've
had companies based around open source for a long time, but very few make
it to the public markets (where we get data to see if they actually work
as companies). A recent exception is Hortonworks (HDP) which
opened at $26.38 in December 2014 but is down to $8.31 as of this
writing, with revenues around [$40million a
quarter](http://hortonworks.com/press-releases/hortonworks-reports-financial-results-second-quarter-2016/).
Red Hat (RHT) did [$2billion in
2016](https://investors.redhat.com/news-and-events/press-releases/2016/03-22-2016-201734069)
(which remember is 5% of Oracles revenues, but still a large amount).

So undoutedly open source has had a large effect on the software
industry as a whole. But the impact on the public markets to date is
minimal in terms of new companies. It will be super interesting to see
if in 5 years time the list of public software companies based on open
source software is larger than it is today.


## Conclusions

I mainly wrote this post so I had something to reference when I talk to
people about the software industry, and in particular what it's like
working for a software vendor. Speculating about or second guessing one
vendor or another is an internet sport (non-more-so than for those that
work at other vendors) but from the outside it's worth an appreciation
of some of the differences I think and a bit of empathy for the
decisions made. And if the above makes you think this all sounds rather
interesting then you'd be right.
