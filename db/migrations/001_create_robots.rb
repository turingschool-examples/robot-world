require 'sqlite3'

database = SQLite3::Database.new("db/robots.db")
database.execute("CREATE TABLE robots (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      name VARCHAR(64),
                                      city VARCHAR(64),
                                      state VARCHAR(2),
                                      department VARCHAR(64)
                                     );"
                )
puts "creating robot table for development"
