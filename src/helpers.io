// Yellow Notes: helpers
// Jacob Peck
// 20120513

nil asString = "n/a"
nil asNumber := -1

Sequence justSerialized := method(stream,
  stream write(self asMutable asSimpleString)
)

List asString := method(
  self join(", ")
)

category := method(name,
  retval := CategoryTable get(name)
  if(retval == nil,
    retval = CategoryTable add(name)
  )
  retval
)

sortbyid := method(
  NoteList notes sortBy(block(x, y, x id < y id))
)

sortbydate := method(
  NoteList notes sortBy(block(x, y, x date < y date))
)

sortbypriority := method(
  NoteList notes sortBy(block(x, y, x priority > y priority))
)

sortbyduedate := method(
  NoteList notes sortBy(block(x, y, x duedate < y duedate))
)

filterbycategory := method(category,
  NoteList notes select(x, x categories map(c, c name) contains(category name))
)

// take action
displayAll := method(
  sortbyid foreach(n,
    n shortDisplay
  )
)

newNote := method(args,
  subject := args join(" ")
  if(subject size > 140,
    writeln("Subject too long!  Note discarded.")
    ,
    n := Note new setSubject(subject)
    NoteList add(n)
  )
)

editNote := method(id,
  n := NoteList get(id asNumber)
  if(n == nil, writeln("No such note with id: #{id}" interpolate); return)
  // edit subject
  n longDisplay
  writeln("\n")
  
  write("Edit subject? (y/N) > ")
  in := File standardInput readLine
  if(in == "y",
    write("New subject: ")
    sub := File standardInput readLine
    if(sub size > 140, 
      writeln("New subject too long, rejected.")
      ,
      n setSubject(sub)
    )
  )
  
  // edit priority
  write("Edit priority? (y/N) > ")
  in := File standardInput readLine
  if(in == "y",
    write("New priority: ")
    priority := File standardInput readLine
    if(priority asNumber asString != priority, 
      writeln("New priority is not a number.")
      ,
      n setPriority(priority)
    )
  )
  
  // edit duedate
  write("Edit due date? (y/N) > ")
  in := File standardInput readLine
  if(in == "y",
    write("New due date month (1-12): ")
    m := File standardInput readLine asNumber
    write("New due date day (1-31): ")
    d := File standardInput readLine asNumber
    write("New due date year (1970-2038): ")
    y := File standardInput readLine asNumber
    write("New due date hour (0-23): ")
    h := File standardInput readLine asNumber
    write("New due date minutes (0-59): ")
    min := File standardInput readLine asNumber
    duedate := Date clone setYear(y) setMonth(m) setDay(d) setHour(h) setMinute(min) setSecond(0)
    n setDuedate(duedate)
  )
  
  // edit categories
  write("Edit categories? (y/N) > ")
  in := File standardInput readLine
  if(in == "y",
    write("New categories (separate by spaces): ")
    cats := File standardInput readLine splitNoEmpties
    cats foreach(c, n categories appendIfAbsent(CategoryTable add(c)))
  )
  
  // edit description
  write("Edit description? (y/N) > ")
  in := File standardInput readLine
  if(in == "y",
    writeln("New description (end with an empty line):")
    desc := ""
    line := File standardInput readLine
    while(line != "",
      desc = desc .. "\n" .. line
      line = File standardInput readLine
    )
    n setDescription(desc asMutable strip)
  )
)

showNote := method(id,
  n := NoteList get(id asNumber)
  if(n == nil,
    writeln("No such note with id: #{id}" interpolate)
    ,
    n longDisplay
  )
)

showByDate := method(
  sortbydate foreach(n,
    n shortDisplay
  )
)

showByDueDate := method(
  sortbyduedate foreach(n,
    n shortDisplay
  )
)

showByPriority := method(
  sortbypriority foreach(n,
    n shortDisplay
  )
)

showCategory := method(category,
  c := CategoryTable get(category asString)
  if(c == nil,
    writeln("No such category: #{category}" interpolate)
    ,
    filterbycategory(c) foreach(n,
      n shortDisplay
    )
  }
)

showRandomNote := method(
  n := NoteList getRandom
  if(n == nil,
    writeln("No notes yet.")
    ,
    n longDisplay
  )
)

removeNote := method(id,
  NoteList remove(id asNumber)
)