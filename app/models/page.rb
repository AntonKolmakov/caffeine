class Page < ActiveRecord::Base
  include Sluggable

  belongs_to :album
  has_many :user_forms
  has_many :page_attachments
  has_one :page_image
  has_one :seo_datum, as: :datable, dependent: :destroy

  delegate :meta_title, :meta_keywords, :meta_description, :seo_text, to: :seo_datum

  accepts_nested_attributes_for :page_image, update_only: true, allow_destroy: true
  accepts_nested_attributes_for :seo_datum, update_only: true

  enum status: %i(draft published blocked)

  validates :name, presence: true
  before_save on: %i(create update destroy) do
    Page.main.update_all(main: false) unless main_page?
  end

  acts_as_tree order: 'position'

  scope :main, -> { where(main: true) }

  def main_page?
    self == Page.main_page || main == false
  end

  def self.main_page
    main.first
  end

  private

  def set_main_page
    Page.main.update_all(main: false)
  end
end
