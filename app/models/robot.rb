require 'sqlite3'

class Robot

  def initialize(robot_params)
    @id = robot_params["id"] if robot_params["id"]
    @name = robot_params["name"]
    @city = robot_params["city"]
    @state = robot_params["state"]
    @department = robot_params["department"]
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
  end

  def save
    @database.execute("INSERT INTO robots (id, name, city, state, department) VALUES (?, ?, ?, ?, ?);", @id, @name, @city, @state, @department)
  end

  def self.all
    database = SQLite3::Database.new('db/robot_world_app_development.db')
    database.results_as_hash = true
    robots = database.execute("SELECT * FROM robots")
    robots.map do |robot|
      Robot.new(robot)
    end
  end
end
