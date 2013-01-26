require 'rubygems'
require 'bundler'

Bundler.require

map '/assets' do
  environment = Sprockets::Environment.new 'game'

  environment.append_path 'assets'
  environment.append_path 'css'
  environment.append_path 'js'
  environment.append_path 'tests'
  environment.append_path 'tpl'

  run environment
end

map '/' do
  run Rack::Directory.new('.').method(:call)
end
