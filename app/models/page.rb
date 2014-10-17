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
  before_validation :set_main_page, on: %i(create update destroy)

  acts_as_tree order: 'position'
  acts_as_list scope: :parent

  scope :main, -> { where(main: true) }

  private

  def set_main_page
    Page.main.update_all(main: false)
  end
end
