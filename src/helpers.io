// Yellow Notes: helpers
// Jacob Peck
// 20120513

nil asString = "n/a"

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
  NoteList notes select(x, x categories contains(category))
)
