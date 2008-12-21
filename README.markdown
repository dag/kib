# Kib

Static Model/View/... uh, Router?

## OMG another?

This one doesn't focus on pages in the way others do.
Instead there are "models" in the form of YAML documents and optionally separate files for specific fields, with their extension controlling the template engine.
There is also a "router" which will build your application from your resources with the routes of your chosing.
This makes it all highly flexible.

Another design goal is to not mix formats in files, unlike e.g. Webby.
This is beneficial for things like syntax highlighting, but means more files and separation.
Separation however has benefits in itself, and many files shouldn't be a problem with generators and good editors.

## How

    $ kib-gen site kiblog
    $ cd kiblog
    $ kib-gen resource posts
    $ rake serve

## Love needed

* Assets overlay
* Better Resource model
* Route macros
* Mount aware helpers (don't assume /)
* More template engines for layouts, views and texts (maybe pluggable)
* Partial views
* Build to a git branch like gh-pages, or a submodule linking to user.github.com
