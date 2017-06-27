require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/robots' do
    erb :index
  end

  get '/robots/:id' do
    @robot = Robot.find(params[:id])
    erb :show
  end

  not_found do
    erb :error
  end
end
