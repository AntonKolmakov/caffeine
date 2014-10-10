class Page < ActiveRecord::Base
  include Sluggable

  belongs_to :album
  has_many :user_forms
  has_many :page_attachments
  has_one :page_image

  enum status: %i(draft published blocked)

  validates :name, presence: true

  acts_as_tree order: 'position'
  acts_as_list scope: :parent
end
