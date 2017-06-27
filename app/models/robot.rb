require 'sqlite3'

class Robot

  attr_reader :name,
              :city,
              :state,
              :department,
              :database

  def initialize(robot_params)
    @name = robot_params["name"]
    @city = robot_params["city"]
    @state = robot_params["state"]
    @department = robot_params["department"]
    @database = SQLite3::Database.new('db/robot_world_app_development.db')
    @database.results_as_hash = true
  end

  def save
    @database.execute("INSERT INTO robots (name, city, state, department) VALUES (?, ?, ?, ?);", @name, @city, @state, @department)
  end

  def self.all
    database = SQLite3::Database.new('db/robot_world_app_development.db')
    database.results_as_hash = true
    robots = database.execute("SELECT * FROM robots")
    robots.map do |robot|
      Robot.new(robot)
    end
  end

  def self.find(name)
    database = SQLite3::Database.new('db/robot_world_app_development.db')
    database.results_as_hash = true
    robot = database.execute("SELECT * FROM robots WHERE name = ?", name).first
    Robot.new(robot)
  end

end
