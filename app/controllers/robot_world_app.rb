require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/robots' do
    @robot = Robot.all
    erb :index
  end

  get '/robots/:id' |id|
    @robot = Robot.find(:id)
    erb :show
end
