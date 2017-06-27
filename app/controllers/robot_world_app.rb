require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/robots' do
    erb :index
  end

  get '/' do
    erb :dashboard
  end

  get '/robots/new' do
    erb :new_robot
  end













end
