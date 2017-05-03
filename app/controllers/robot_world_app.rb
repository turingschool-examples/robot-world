require_relative '../models/robot.rb'
require 'pry'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :index
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

  get '/robots/:id' do
    @robot = Robot.find(params[:id])
    erb :show
  end
end

