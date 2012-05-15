// Yellow Notes: Note
// Jacob Peck
// 20120513

Note := Object clone do(
  id ::= nil
  subject ::= nil
  date ::= nil
  duedate ::= nil
  description ::= nil
  priority ::= nil
  categories ::= nil
  
  init := method(
    self id = nil
    self subject = nil
    self date = nil
    self duedate = nil
    self description = nil
    self priority = nil
    self categories = nil
  )
  
  new := method(
    self clone setId(IdGenerator next) setDate(Date now clone) setCategories(list)
  )
  
  shortDisplay := method(
    writeln("#{id}: #{subject}" interpolate)
    self
  )
  
  longDisplay := method(
    self shortDisplay
    writeln("date: #{date}\ndue date: #{duedate}\npriority: #{priority}" interpolate)
    writeln("categories: #{categories}\ndescription:\n#{description}" interpolate)
    self
  )
)

NoteList := Object clone do(
  notes ::= list
  
  clone := method(self)
  
  add := method(note, self notes append(note))
  
  get := method(identifier, self notes foreach(n, if(n id == identifier, return n)); nil)
  
  getRandom := method(
    self notes sortBy(block(x, y, x uniqueId asNumber * Random value < y uniqueId asNumber * Random value)) first
  )
  
  remove := method(identifier,
    self notes remove(self get(identifier))
  )
)