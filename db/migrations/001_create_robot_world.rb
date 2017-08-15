require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")
database.execute("CREATE TABLE robots (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      name VARCHAR(64),
                                      city VARCHAR(64),
                                      state VARCHAR(64),
                                      department VARCHAR(64)
                                     );"
                )
database.execute("insert into robots (name, city, state, department) VALUES ('Fred', 'Houston', 'Texas', 'Purple Sector');")
database.execute("insert into robots (name, city, state, department) VALUES ('Troy', 'Detroit', 'Michigan', 'Blue Sector');")
database.execute("insert into robots (name, city, state, department) VALUES ('Marsha', 'Chicago', 'Illinois', 'Black Sector');")
database.execute("insert into robots (name, city, state, department) VALUES ('Louise', 'Seattle', 'Washington', 'White Sector');")
database.execute("insert into robots (name, city, state, department) VALUES ('Hannah', 'New York', 'New York', 'Yellow Sector');")

puts "Items table created and seeded."
