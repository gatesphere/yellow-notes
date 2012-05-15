Yellow Notes
============

A command line idea manager


Overview
--------

Yellow Notes is a command line program to organize your ideas, in short snippets.

Yellow Notes is sort of a hybrid to-do list and scratchpad.  You can create notes,
which may have categories, priorities, due dates, names, and both short (<= 140 
characters) and long (any size) descriptions.  You may display notes by priority, 
date, due date, or category, or if you just want something to do, you can pick
a random note from your database.

License
-------

Yellow Notes is BSD Licensed.  See [license/license.txt](https://raw.github.com/gatesphere/yellow-notes/master/license/license.txt)
for more information.

Installation
------------

Installation is simple, but has a few requirements:

   1. A unix-like system (Cygwin works too)
   2. Super-user rights (optional)
   3. A working installation of the [Io Programming Language](http://iolanguage.com)
   
Once you have these requirements, installation is dead simple:

   1. Clone the repo
       `git clone https://github.com/gatesphere/yellow-notes.git`
   2. Create a symlink to yn.sh in some directory in your path.
       `ln -s /path/to/yellow-notes/yn.sh /home/username/bin/yn` or similar
      If you would like to install it for everyone on the system and have super-user rights:
       `sudo ln -s /path/to/yellow-notes/yn.sh /usr/bin/yn` or similar.  Note that this way,
      all notes will be shared with the entire system, and the data dir within yellow-notes
      must be world-writable.
   3. Relax!  You're set up.
   
Usage
-----

Yellow Notes is fairly easy to use.

Create a new note:

    $ yn new This is a note subject.  It is <= 140 characters.
    
View all notes (short form):

    $ yn

View all notes, sorted by date (short form):

    $ yn date
    
View all notes, sorted by due date (short form):

    $ yn duedate
    
View all notes, sorted by priority (short form):

    $ yn priority
    
View all notes tagged with a certain category (short form):

    $ yn category category_name
    
View detailed information about a specific note (long form):

    $ yn show note_id
    
Edit detailed information about a specific note (interactive):

    $ yn edit note_id
    
Show a random note (long form):

    $ yn random
    
Delete a note permanently:

    $ yn note_id
