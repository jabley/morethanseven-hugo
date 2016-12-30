---
comments: true
created_at: 2006/11/15}
date: 2006-11-15T00:00:00Z
title: Mac Virtualhost follow up
url: /2006/11/15/mac-virtualhost-follow-up/
---

<p>
A couple of people asked for the details of the virtualhost script I modified for use with MAMP in a <a href="http://morethanseven.net/posts/virtualhosts-on-mac-os-x#comment">previous post</a>. Apologies for taking a bit of time.

</p>
<p>
First I had to make these changes to the original <a href="http://patrickgibson.com/utilities/virtualhost/">virtualhost script</a>:

</p>
<code>
DOC\_ROOT\_PREFIX="/Applications/MAMP/htdocs"
</code>

<code>

    APACHE_CONFIG="/Applications/MAMP/conf/apache" 
    APACHECTL="/Applications/MAMP/Library/bin/apachectl"

</code>

<p>
I also made a few changes to httpd.conf in /Applications/MAMP/conf/apache. From memory first to allow local .htaccess files to override everything on a per directory basis.

</p>
<code>

    &lt;Directory "/Applications/MAMP/htdocs"&gt;
    oAllowOverride All
    &lt;/Directory&gt;

</code>

<p>
and then to point to the virtual hosts directory.

</p>
<code>

    NameVirtualHost 127.0.0.1
    Include /Applications/MAMP/conf/apache/virtualhosts

</code>

<p>
I keep meaning to do a screen capture tutorial of sorts, so maybe something like this would be a good starting point? We shall see as and when time permits. Probably this time next year. Any problems let me know and I’ll try and debug.

</p>
