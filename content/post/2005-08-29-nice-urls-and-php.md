---
comments: true
created_at: 2005/08/29}
date: 2005-08-29T00:00:00Z
title: Nice URLs and PHP
url: /2005/08/29/nice-urls-and-php/
---

<p>
I all one for nice url’s, that is removing all the gumf involving question marks and ampersands and the like for something that is both shorter, more human readable and more search engine friendly.

</p>
<p>
Doing it in PHP is actually pretty straightforward once you get the hang of it and can be pretty powerful – so here goes with a short tutorial of sorts. It’s will probably be brief and make too many assumptions of the reader – any questions just let me know and I may even try and write it up properly.

</p>
<p>
The basic principle is to stop using the GET array (accessible from $\_SERVER\[‘GET’\]) to make descisions with. The question then becomes what to replace it with. A simple class borrowed from the <a href="http://www.sitepoint.com">Sitepoint</a> <a href="http://www.sitepoint.com/books/phpant1/">PHP Anthology</a> book written by <a href="http://www.sitepoint.com/books/phpant1/about.php">Harry Fuecks</a> is at least my answer. The PathVars class does pretty much what is says in the name, specifically providing access to the path contents in the form of an array. I’ll provide a link to a <a href="/code/dispatcher.zip">code archive</a> for this article rather than just copy and paste whole classes – download it now if you are interested in the behind the scenes bits.

</p>
<p>
So we now create a new PathVars instance like so:

</p>
<code>

    /* Pathvars object */
    $pathvars = new PathVars($_SERVER['SCRIPT_NAME']);

</code>

<p>
And we can now magically get access to each element of the path (separated by a /) from the instance variable pathvars:

</p>
<code>$params = $pathvars-&gt;pathVars;</code>

<p>
Or more correctly by using the method provided:

</p>
<code>$pathvars-&gt;fetchByIndex(0)</code>

<p>
Where the fetchByIndex parameter is the element you want from the array.

</p>
<p>
Ok, so so far I’m really just repeating the work of others, if you like this sort of thing I’d really recommend the book. The next step on top of this is however is to decide what to do with the information when you have it. The following shows a very simple example – potentially for use in a simple blog or news site:

</p>
<code>

    switch ($pathvars-&gt;fetchByIndex(0)) {

        case "article":
           include(views/article.view.php);

        case "page":
           include(views/page.view.php);

        default:
           include('views/home.view.php');
    }

</code>

<p>
In this example where we have www.example.com/article or www.example.com/article/a\_sample\_article\_name the article view include file is used.

</p>
<p>
What these include files then do is up to you, in my case each of them passes different parameters to a simple templating system which then outputs the page. Again, have a look at the code samples to see that in action.

</p>
<p>
Let me know if anyone found this interesting, useful or informative and I might post other titbits, otherwise it’s probably back to inane ramblings and misplaced conjecture.

</p>
