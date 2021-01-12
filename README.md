# pg-queue

A queue implementation within PostgreSQL

Few weeks ago a former collegue of mine asked for a possible implementation of a
queue system interely done in PostgreSQL (with reasons). I have made some quick
research and found some good starting points. Here are the some ideas about the
topic.

## Links

 - [This](https://gist.github.com/chanks/7585810) is the starting point where
   the `SKIP LOCKED` is mentioned

 - A [full blog
   post](https://www.2ndquadrant.com/en/blog/what-is-select-skip-locked-for-in-postgresql-9-5/)
   where `SKIP LOCKED` is explained in full

 - A [Django's plugin](https://github.com/SweetProcess/django-pg-queue) using
   `SKIP LOCKED`

 - Alternative implementation [in Ruby](https://github.com/que-rb/que) using [advisory
   locks](https://www.postgresql.org/docs/current/explicit-locking.html#ADVISORY-LOCKS)

 - An old implementation by [Skype's
   folks](https://wiki.postgresql.org/wiki/PGQ_Tutorial)

