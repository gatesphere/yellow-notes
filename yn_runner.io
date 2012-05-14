#!/usr/bin/env io

// Yellow Notes: runner
// Jacob Peck
// 20120514

// set up environment
YN_DIR := System getEnvironmentVariable("YN_DIR")
if(YN_DIR == nil,
  writeln("The environment variable YN_DIR is not set.  Exiting.")
  System exit
)
yn_path := Path absolute(YN_DIR)
yn_data_path := Path with(YN_DIR, "data")
yn_src_path := Path with(YN_DIR, "src")

doFile(Path with(yn_src_path, "helpers.io"))

Note := nil
NoteList := nil
IdGenerator := nil
Category := nil
CategoryTable := nil

// create data directory if it doesn't exist
if(Directory exists(yn_data_path) not,
  Directory with(yn_data_path) create
)

// attempt to deserialize first, failing that initialize
data_dir := Directory with(yn_data_path)
if(data_dir files size == 5,
  // deserialize
  Note = doFile(Path with(yn_data_path, "Note.io"))
  NoteList = doFile(Path with(yn_data_path, "NoteList.io"))
  IdGenerator = doFile(Path with(yn_data_path, "IdGenerator.io"))
  Category = doFile(Path with(yn_data_path, "Category.io"))
  CategoryTable = doFile(Path with(yn_data_path, "CategoryTable.io"))
  ,
  // initialize
  src_dir := Directory with(yn_src_path)
  src_dir files foreach(f,
    doFile(f path)
  )
)

// parse command line


// take action


// serialize data
data_dir files foreach(f,
  f remove
)
// Note
File openForAppending(Path with(yn_data_path, "Note.io")) write(Note serialized) close

// NoteList
File openForAppending(Path with(yn_data_path, "NoteList.io")) write(NoteList serialized) close

// IdGenerator
File openForAppending(Path with(yn_data_path, "IdGenerator.io")) write(IdGenerator serialized) close

// Category
File openForAppending(Path with(yn_data_path, "Category.io")) write(Category serialized) close

// CategoryTable
File openForAppending(Path with(yn_data_path, "CategoryTable.io")) write(CategoryTable serialized) close

// exit
System exit
