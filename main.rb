require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sprockets'
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
  # イニシャライズ
  set :environment, Sprockets::Environment.new

  # assetsファルダのパスを追加
  environment.append_path "assets/scss"
  environment.append_path "assets/js"

  # 圧縮
  environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  # get aseets
  get '/assets/*' do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end  
  


  get '/' do
    @message = "hello"
    erb :index
  end

  get '/show' do
    "hello"
  end
end