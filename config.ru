# require 'rack/cache'
require 'sprockets'
require './main.rb'

# use Rack::Cache

map '/assets' do
  run MainApp.sprockets
end

run MainApp