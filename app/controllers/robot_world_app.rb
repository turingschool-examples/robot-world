require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  # get '/' do
  #   erb :layout
  # end

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    @robot = Robot.new(params[:robot])
    @robot.save
    require 'pry'; binding pry
    redirect '/robots'
  end
end
