require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.expand_path("app", __dir__))

require 'controllers/robot_world_app'

run RobotWorldApp
