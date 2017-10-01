require './uploader/images_uploader'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'image.sqlite3')

class Image < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
end