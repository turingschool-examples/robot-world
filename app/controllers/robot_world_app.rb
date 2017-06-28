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
    erb :new
  end

  post '/robots' do
    robot = Robot.new(params[:robot])
    robot.save
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = Robot.find(params[:id].to_i)
    erb :show
  end

  get '/robots/:id/edit'do
    @robot = Robot.find(params[:id])
    erb :edit
  end

  put '/robots/:id' do |id|
    Robot.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    Robot.destroy(id)
    redirect '/robots'
  end

  not_found do
    erb :error
  end

end
