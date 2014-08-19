class Image < ActiveRecord::Base
  belongs_to :album

  validates :name, presence: true

  before_create :default_name

  mount_uploader :picture, PictureUploader

  def default_name
    self.name ||= File.basename(picture.filename, '.*').titleize if picture
  end
end
