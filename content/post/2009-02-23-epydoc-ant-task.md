---
comments: true
created_at: 2009/02/23}
date: 2009-02-23T00:00:00Z
title: Epydoc Ant task
url: /2009/02/23/epydoc-ant-task/
---

I quite like [Epydoc](http://epydoc.sourceforge.net/) for generating Python API documentation, even if the interface looks a little dated and could do with a lick of paint.

For most project I use an Ant build script to generate documentation when needed. You could wrap the basic commands in a make file or a bash script if you prefer that sort of thing though. The only trick is to make sure you have everything you need on your Python Path. In Django projects, or App Engine projects, you'll probably find the default runner script plays with the path somewhat. The following example adds the current directory to the path along with an ext directory where I stash external modules, which should see it run cleanly without any import errors.

pre. <project name="secretproject" default="create-api">
<property name="name" value="secretproject"/>
<property name="parent" value="/www/projects"/>
<property name="api" value="/www/project/secretproject/api"/>
<target name="create-api" description="Generate API documentation with epydoc">
<exec executable="/bin/sh">
<env key="PYTHONPATH" value="${parent}:${parent}/${name}/ext:$PYTHONPATH"/>
<env key="DJANGO_SETTINGS_MODULE" value="${name}.settings"/>
<arg line="-c 'epydoc --html -o ${api} --name ${name} --graph all ${name}'"/>
</exec>
</target>
</project>
