require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    redirect '/robots'
  end

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot = Robot.new(params[:robots])
    robot.save
    redirect '/robots'
  end

  get '/robots/:id' do
    @robot = Robot.find_by(params[:id])
    erb :show
  end

  not_found do
    erb :error
  end
end
