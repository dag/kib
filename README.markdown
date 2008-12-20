# Kib

Static Model/View/... uh, Router?

## OMG another?

This one doesn't focus on pages in the way others do.
Instead there are "models" in the form of YAML documents and optionally separate files for specific fields, with their extension controlling the template engine.
There is also a "router" which will build your application from your resources with the routes of your chosing.
This makes it all highly flexible.

## Love needed

* Split into namespaced libraries and generators
* Helper methods
* Use modification stamps to speed up rebuilds
* More template engines for layouts, views and texts (maybe pluggable)
* Partial views
* Perhaps don't render underscored sass sheets
