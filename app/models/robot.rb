require 'sqlite3'

class Robot
  attr_reader :name

  def initialize(robot_params)
    @name = robot_params["name"]
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
  end

  def self.all
    robot = database.execute("SELECT * from ROBOTS")
    robot.map do |task|
      Robot.new(task)
    end
  end

  def self.database
    database = SQLite3::Database.new('db/robot_world_development.db')
    database.results_as_hash = true
    database
  end
end
