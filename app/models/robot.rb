require 'sqlite3'

class Robot
  attr_reader :name,
              :id,
              :city,
              :state,
              :department

  def initialize(robot_params)
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    @name        = robot_params["name"]
    @id          = robot_params["id"] if robot_params["id"]
    @city        = robot_params["city"]
    @state       = robot_params["state"]
    @department  = robot_params["department"]
  end


  def save
    @database.execute("INSERT INTO robots (name, city, state, department) VALUES (?, ?, ?, ?);", @name, @city, @state, @department)
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
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    robot = @database.execute("SELECT * FROM robots WHERE id = ?", id).first
    Robot.new(robot)
  end

  def self.update(id, robot_params)
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    @database.execute("UPDATE robots
                      SET name = ?,
                          city = ?,
                          state = ?,
                          department = ?
                      WHERE id = ?;",
                      robot_params[:name],
                      robot_params[:city],
                      robot_params[:state],
                      robot_params[:department],
                      id)

    Robot.find(id)
  end

  def self.destroy(id)
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    @database.execute("DELETE FROM robots
                      WHERE id = ?;", id)
  end

end
