// Yellow Notes: Category
// Jacob Peck
// 20120513

Category := Object clone do(
  name ::= nil
  
  with := method(name,
    self clone setName(name)
  )
  
  asString := method(name)
  
  equals := method(other,
    other name == self name
  )
)

CategoryTable := Object clone do(
  table := Map clone
  
  clone := method(self)
  
  get := method(name,
    self table at(name)
  )
  
  add := method(name,
    self table atIfAbsentPut(name, Category with(name))
  )
)