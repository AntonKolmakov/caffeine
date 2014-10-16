class Image < ActiveRecord::Base
  belongs_to :album, inverse_of: :images

  mount_uploader :picture, PictureUploader

  delegate :name, to: :album, prefix: true
end
