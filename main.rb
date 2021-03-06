require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sprockets'
require 'sprockets-helpers'
require 'uglifier'
require 'sass'
require 'coffee-script'
require 'carrierwave'
require "carrierwave/orm/activerecord"
require './models/images.rb'

class MainApp < Sinatra::Base
  # リローダーが有効になる
  configure :development do
    register Sinatra::Reloader
  end
  # layout.rbが有効になる
  enable :inline_template

  register Sinatra::ActiveRecordExtension

  # carrierwave
  CarrierWave.configure do |config|
    config.root = File.dirname(__FILE__) + "/public"
  end


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
  
  # before do
  #   cache_control :public, :must_revalitive, :max_age => 60
  # end

  get '/' do
    @message = "Hello sprokets reloader!"
    @image   = Image.all.order('created_at DESC')
    erb :index
  end

  post '/' do
    #　create new model
    img = Image.new
    # save the data from reuest
    img.image = params[:file]
    img.title = "title"
    img.save

    redirect '/'
  end

  get '/show' do
    "hello"
  end
end