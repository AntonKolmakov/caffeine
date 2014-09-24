class Album < ActiveRecord::Base
  has_many :pages
  has_many :images, -> { order 'position' }, dependent: :destroy

  validates :name, presence: true

  acts_as_tree

  mount_uploader :watermark, PictureUploader

  # Recreate all attached images versions to apply new watermark
  after_save :recreate_versions, on: :update, if: -> { changed_attributes[:watermark] }

  protected

  def recreate_versions
    images.find_each.map { |i| i.picture.recreate_versions! }
  end
end
