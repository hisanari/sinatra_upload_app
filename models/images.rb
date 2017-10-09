require './uploader/images_uploader'

# ActiveRecord::Base.establish_connection(
#   adapter: 'sqlite3',
#   database: 'development.sqlite3',
#   host: 'localhost'
#   )

class Image < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
end