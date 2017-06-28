require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get '/robots/new' do
    erb :new_robot
  end

  post '/robots' do
    robot = Robot.new(params[:robot])
    robot.save

    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = Robot.find(id)

    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = Robot.find(id)

    erb :edit
  end

  put '/robots/:id' do |id|
    Robot.update(id, params[:robot])

    redirect '/robots'
  end

  delete '/robots/:id/delete' do |id|
    Robot.destroy(id)

    redirect '/robots'
  end
end
