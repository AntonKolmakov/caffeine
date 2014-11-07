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

  # triggered unless page is not itself and is not selected as the main page
  before_save on: %i(create update destroy) do
    Page.main.update_all(main: false) unless main_page?
  end

  acts_as_tree order: 'position'

  # we don't need this till we fetch all pages through class method
  # roots_and_descendants_preordered, which returns all nodes in your tree, pre-ordered.
  # So, you can uncomment this convenient way and ordering pages by parent
  # acts_as_list scope: :parent

  scope :main, -> { where(main: true) }

  def main_page?
    self == Page.main_page || !main?
  end

  def self.main_page
    main.first
  end
end
