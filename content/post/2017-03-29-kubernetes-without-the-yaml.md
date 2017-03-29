+++
date = "2017-03-29T13:56:00Z"
title = "Kubernetes configuration without the YAML"
url = "/2017/03/29/kubernetes-configuration-without-the-yaml/"
+++


Tomorrow at KubeCon in Berlin I'm running a birds-of-a-feather session to talk
about Kubernetes configuration. Specifically we'll be talking about whether
Kubernetes configuration benefits from a domain specific language. If you're
at the conference and this sounds interesting [come along](http://sched.co/9Tcc).

## The problem

The fact the programme committee accepted the session proposa is hopefully a good
indication that at least some other people in the community think this is an
interesting topic to discuss. I've also had a number of conversations in person
and on the internet about similar areas.

There are a number of other traces of concerns with using YAML as the main user
interface to Kubernetes configuration. This comment from Brian Grant of Google on the
Kubernetes Config SIG mailing list for instance:

> We've had a few complaints that YAML is ugly, error prone, hard to read, etc.
> Are there any other alternatives we might want to support?

And [this one](https://twitter.com/jbeda/status/833408476437110784) from Joe Beda,
one of the creators of Kubernetes:

>I want to go on record: the amount of yaml required to do anything in k8s is a
> tragedy. Something we need to solve. (Subtweeting HN comment)

This quote from the [Borg, Omega and Kubernetes paper in ACM Queue, Volume 14, issue 1](http://queue.acm.org/detail.cfm?id=2898444)
nicely sums up my feelings:

> The language to represent the data should be a simple, data-only format
> such as JSON or YAML, and programmatic modification of this data should
> be done in a real programming language

This quote also points at the problem I see at the moment. The configuration and the
management of that configuration are _separate_ but related concerns. Far too many
people couple these together, ultimately moving all of the management complexity
onto people. That's a missed opportunity in my view. The Kubernetes API is my
favourite think about the project, I've waxed lyrical about it allowing for
different higher-level user interfaces for different users to all interact
on the same base platform. But treating what is basically the wire format
as a user interface is just needlessly messy.

But what advantages do we get using a programming language to modify the data?
For me it comes down to:

* Avoiding repetition
* Combining external inputs
* Building tools to enforce correctness (linting, unit testing, etc.)
* The abililty to introduce abstractions

It's the last part I find most compelling. Building things to allow others
to interact with a smaller domain specific abstraction is one way of scaling
expertise. The infrastructure as code space I've been involved in has lots of
stories to tell around different good (and bad) ways of mixing data with code,
but the idea that data on it's own is enough without higher-level abstractions
doesn't hold up in my experience.


## What can I use instead?

Lukily various people at this point have build tools in this space. I'm not sure
could or should be a single answer to the question (whether there should be a
default is a harder question to answer) but the following definitely all show
what's possible.

* [Jsonnet](http://jsonnet.org/)
* [kubecfg](https://github.com/anguslees/kubecfg)
* [Puppet Kubernetes types](https://github.com/garethr/garethr-kubernetes)
* [Kubeplay](https://github.com/errordeveloper/kubeplay)
* [Terraform](https://github.com/maxmanuylov/terraform-provider-kubernetes)
* [Kotlin DSL](https://github.com/fkorotkov/k8s-kotlin-dsl)
* [Skuber](https://github.com/doriordan/skuber) (Scala DSL for Kubernetes)

Obviously [I wrote one of these](https://puppet.com/blog/managing-kubernetes-configuration-puppet)
so I'm biased but different tools work for different people and in different
contexts. For example Skuber looks nice but I mainly don't like Scala. And
I've been using Jsonnet for Packer templates recently with success, so I'm
very interested in kubecfg which provides a nice Kubernetes wrapper to that
tool.

Ultimately this is still a developing space, but compared to a year ago it is
now definitely moving. For me, I hope the default for managing Kubernetes
configuration slowly but surely switches away from just hand rolling data.
Towards what, only time and people reporting what works for them will tell.


