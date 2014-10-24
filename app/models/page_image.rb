class PageImage < ActiveRecord::Base
  belongs_to :page

  mount_uploader :picture, PictureUploader
end
