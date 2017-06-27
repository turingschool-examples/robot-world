require 'sqlite3'

class Robot
  def initialize(robot_params)
    
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
  end


end
