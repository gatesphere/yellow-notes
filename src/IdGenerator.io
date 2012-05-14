// Yellow Notes: Id Generator
// Jacob Peck
// 20120513

IdGenerator := Object clone do(
  accum := -1
  
  clone := method(self)
  
  next := method(self accum = self accum + 1)
)
