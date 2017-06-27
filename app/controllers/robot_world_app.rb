require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  not_found do
    erb :error
  end

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot = Robot.new(params[:robot])
    robot.save
    redirect '/robots'
  end

  get '/robots/:name' do
    @robot = Robot.find(params[:name])
    erb :show
  end

  get '/tasks/:id/edit' do
    @robot = Robot.find(params[:name])
    erb :edit
  end
end
