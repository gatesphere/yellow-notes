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
    self clone setId(IdGenerator next) setDate(Date now clone)
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
)