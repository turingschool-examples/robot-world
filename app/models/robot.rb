require 'sqlite3'

class Robot

  def initialize(robot_params)
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
  end

  def save
    @database.execute("INSERT INTO robots (id, name, city, state, department) VALUES (?, ?, ?, ?, ?);", @id, @name, @city, @state, @department)
  end
end
