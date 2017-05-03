require 'sqlite3'

class Robot
  attr_reader :name, :city, :id
  def initialize(robot_params)
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    @name = robot_params["name"]
    @city = robot_params["city"]
    @id = robot_params["id"] if robot_params["id"]
  end

  def save
    @database.execute("INSERT INTO robots (name, city) VALUES (?, ?);", @name, @city)
  end

  def self.all
    database = SQLite3::Database.new('db/robot_world_development.db')
    database.results_as_hash = true
    robots = database.execute("SELECT * FROM robots")
    robots.map do |robot|
      Robot.new(robot)
    end
  end

  def self.find(id)
    database = SQLite3::Database.new('db/robot_world_development.db')
    database.results_as_hash = true
    robot = database.execute("SELECT * FROM robots WHERE id = ?", id).first
    Robot.new(robot)
  end 

end
