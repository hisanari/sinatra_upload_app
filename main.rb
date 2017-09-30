require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sprockets'
require 'sprockets-helpers'
require 'uglifier'
require 'sass'
require 'coffee-script'


class MainApp < Sinatra::Base
  # リローダーが有効になる
  configure :development do
    register Sinatra::Reloader
  end
  # layout.rbが有効になる
  enable :inline_template

  # sproketsの設定
  set :sprockets,    Sprockets::Environment.new(root)
  
  configure do
    # assetsファルダのパスを追加
    sprockets.append_path File.join(root, 'assets', 'scss')
    sprockets.append_path File.join(root, 'assets', 'js')
    # 圧縮
    sprockets.js_compressor  = :uglify
    sprockets.css_compressor = :scss

    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix      = '/assets'
      config.digest      = true
      config.debug       = true if development? 
    end

  end

  helpers do
    include Sprockets::Helpers
  end
  
  before do
    cache_control :public, :must_revalitive, :max_age => 60
  end

  get '/' do
    @message = "Hello sprocket!!"
    erb :index
  end

  get '/show' do
    "hello"
  end
end