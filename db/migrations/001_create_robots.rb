# db/migrations/001_create_robots.rb

require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_app_development.db")
database.execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      name VARCHAR(64),
                                      city VARCHAR(64),
                                      state VARCHAR(64),
                                      department VARCHAR(64)
                                     );"
                )

puts "creating robots table for development"
