class Image < ActiveRecord::Base
  belongs_to :album

  mount_uploader :picture, PictureUploader
end
