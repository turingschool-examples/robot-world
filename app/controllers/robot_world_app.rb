require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true


  get '/robots' do
    @robot = Robot.all
    erb :index
  end

  get '/robots/new' do
    erb :new_robot
  end

  get '/robots/:id' do
    @robot = Robot.find(params[:id])
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

  put '/robots/:id' do |id|
    Robot.update(params[:id].to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    Robot.destroy(id.to_i)
    redirect '/robots'
  end

  #add all attributes, add styling, do extensions
end
