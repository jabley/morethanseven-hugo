---
comments: true
created_at: 2007/03/18}
date: 2007-03-18T00:00:00Z
title: Semantic Web acronym links primer
url: /2007/03/18/semantic-web-acronym-links-primer/
---

One thing you hit pretty rapidly when you start having a look into all this Semantic Web malarkey is the number of rather *silly* acronyms and abbreviations. In fairness it's true of pretty much every technical or academic discipline I've come across and you can ask the people I work with what I think about that - I wont ramble on here.

And dont think this is all because I'm not technical enough for ya, I have code on my blog and a faintly scary collection of technical tomes. I just think acronyms tend to breed elitism and make the world less penetrable, especially when they are often described in relation to other acronyms. So, after pointing out a problem here's a stab at a solution; a web designers guide (with the relevant links) to my understanding of the different things involved. I'm not an expert on this yet mind, so if I'm wrong and someone more knowlegable can provide a better description then please comment. If the descriptions from the relevant links I have are good enough I'll just use those as well.

Most people will probably have come across [XML](http://www.w3.org/XML/) so hopefully this is an easy one. XML is the eXtensible Markup Language. For me that means it's a set of rules for defining your own markup language; from simple data exchange formats to whole programming languages. The W3C says (which I think nicely highlights my problem from above)

> Extensible Markup Language (XML) is a simple, very flexible text format derived from SGML (ISO 8879)

[XSLT](http://www.w3.org/TR/xslt) is another quite common tool. The W3C again defines it in relation to another acronym but this time I dont mind as much and we've got a defintion of XML here anyway.

> \[XSLT is\] a language for transforming XML documents into other XML documents

This is a pretty straighforward description, the only real problem for the outsider is wondering why you would want to do that!

[RDF](http://www.w3.org/RDF/) [W3Schools says](http://www.w3schools.com/rdf/default.asp) is really where the Semantic Web stuff starts. The W3C start off with:

> The Resource Description Framework (RDF) integrates a variety of application...

Ah. It integrates applications... What! But wait:

> The RDF specifications provide a lightweight ontology system to support the exchange of knowledge on the Web

This is pretty good actually, as long as you're happy with the word [ontology](http://en.wikipedia.org/wiki/Ontology_%28computer_science%29). Their is a [good article](http://www.xml.com/pub/a/2001/01/24/rdf1.html) that takes a stab at the question from Tim Bray. I think, simply put, RDF is common set of rules for defining your own meta data (information about information) so it's interopable with everyone else doing the same thing.

But how are we going to get all that RDF into our web pages (Semantic or otherwise)? [RDFa](http://www.w3.org/TR/xhtml-rdfa-primer/) is one possibility (not going there right now) which involves extending HTML (all varieties) with some additional attributes with the purpose of being able to embed RDF in the document. Or from the W3C:

> RDFa is a syntax that expresses this structured data using a set of elements and attributes that embed RDF in HTML

[GRDDL](http://www.w3.org/TR/2004/NOTE-grddl-20040413/) is probably the worst offender here in terms of someone spending too much time coming up with the acronym. It stands for *Gleaning Resource Descriptions from Dialects of Languages*. From looking it appears to be a standard way of saying:

> Here be some RDF. If you want the RDF for this document please use this XSL transformation.

[eRDF](http://research.talis.com/2005/erdf/wiki/Main/RdfInHtml), or embedded RDF is a simpler approach to RDFa which involves no additional custom attributes but does not aim to be able to represent all the possible RDF constructs.

Of course their are many more, but at least that's a start. Let me know what you think.
