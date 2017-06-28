require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    redirect '/robots'
  end

  get '/robots' do
    @robot = Robot.all
    erb :index
  end

  get '/robots/new_robot' do
    erb :new_robot
  end

  get '/robots/:id' do |id|
    @robot = Robot.find(id)
    erb :show
  end

  post '/robots' do
    robot = Robot.new(params[:robot])
    robot.save
    redirect '/robots'
  end

  get '/robots/:id/edit' do
    @robot = Robot.find(params[:id])
    erb :edit
  end


end
