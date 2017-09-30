require 'rack/cache'
require 'sprockets'
require './main.rb'

use Rack::Cache

# assetsフォルダを使うとき処理される
map '/assets' do
  run MainApp.sprockets
end

run MainApp