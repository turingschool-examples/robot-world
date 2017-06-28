require 'sqlite3'

class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :department

  def initialize(robot_params)
    @id = robot_params["id"] if robot_params["id"]
    @name = robot_params["name"]
    @city = robot_params["city"]
    @state = robot_params["state"]
    @department = robot_params["name"]
    @database = SQLite3::Database.new('db/robots.db')
    @database.results_as_hash = true
  end

  def save
    @database.execute("INSERT INTO robots (name, city, state, department) VALUES (?, ?, ?, ?)", @name, @city, @state, @department)
  end

  def self.all
    robots = database.execute("SELECT * FROM robots")
    robots.map do |robot|
      Robot.new(robot)
    end
  end

  def self.find_by_id(id)
    robot = database.execute("SELECT * FROM robots WHERE id = ?", id).first
    Robot.new(robot)
  end

  def self.update(id, params)
    database.execute("UPDATE robots
                      SET name = ?,
                          city = ?,
                          state = ?,
                          department = ?
                      WHERE id = ?;",
                          params[:name],
                          params[:city],
                          params[:state],
                          params[:department],
                          id)
  end

  def self.destroy(id)
    database.execute("DELETE FROM robots
                      WHERE id = ?", id)
  end

  def self.database
    database = SQLite3::Database.new('db/robots.db')
    database.results_as_hash = true
    database
  end
end
