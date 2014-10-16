class Album < ActiveRecord::Base
  include Sluggable

  has_many :pages
  has_many :images, -> { order 'position' }, dependent: :destroy, inverse_of: :album
  has_one :seo_datum, as: :datable, dependent: :destroy

  accepts_nested_attributes_for :seo_datum, update_only: true

  validates :name, presence: true

  mount_uploader :watermark, PictureUploader

  # Recreate all attached images versions to apply new watermark
  after_save :recreate_versions, on: :update, if: -> { changed_attributes[:watermark] }

  protected

  def recreate_versions
    images.find_each.map { |i| i.picture.recreate_versions! }
  end
end
