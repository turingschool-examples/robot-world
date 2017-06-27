require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)
  set :method_override, true

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

  get '/robots/:name/edit' do
    @robot = Robot.find(params[:name])
    erb :edit
  end

  put '/robots/:name' do |name|
    Robot.update(name, params[:robot])
    redirect "/robots/#{name}"
  end

end
