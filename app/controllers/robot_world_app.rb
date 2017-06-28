require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get "/robots/new" do
    erb :create_robot
  end

  get '/robots/:id' do
    @robot = Robot.find_by_id(params[:id])
    erb :robot
  end

  get "/robots/:id/edit" do
    @robot = Robot.find_by_id(params[:id])
    erb :edit
  end

  post "/robots" do
    robot = Robot.new(params[:robot])
    robot.save
    redirect '/robots'
  end

  put "/robots/:id" do
    Robot.update(params[:id].to_i, params[:robot])
    redirect "robots/#{params[:id]}"
  end

  delete "/robots/:id" do
    Robot.destroy(params[:id].to_i)
    redirect "/robots"
  end
end
