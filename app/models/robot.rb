require 'sqlite3'

class Robot
  attr_reader :id, :name, :city, :state, :department
  def initialize(robot_params)
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    @id = robot_params[:id] if robot_params[:id]
    @name = robot_params[:name]
    @city = robot_params[:city]
    @state = robot_params[:state]
    @department = robot_params[:department]
  end

  def self.all

  end
end
