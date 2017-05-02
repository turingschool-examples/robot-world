require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :index
  end

  get '/robots' do
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do

  end
   
end

