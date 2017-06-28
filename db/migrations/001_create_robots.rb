require "SQLite3"

database = SQLite3::Database.new('db/robots_development.db')
database.execute("CREATE TABLE robots (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      name VARCHAR(64),
                                      city VARCHAR(64),
                                      state VARCHAR(10),
                                      department VARCHAR(64)
                                      );"
                )

database.execute("INSERT INTO robots(name, city, state, department) VALUES('Megatron', 'Metropolis', 'NY', 'Demolition')")
database.execute("INSERT INTO robots(name, city, state, department) VALUES('Optimus Prime', 'Metropolis', 'NY', 'Engineering')")

puts "creating robots table for development"
