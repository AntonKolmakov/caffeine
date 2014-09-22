class Page < ActiveRecord::Base
  include Sluggable

  has_many :page_attachments
  belongs_to :album

  enum status: %i(draft published blocked)

  validates :name, presence: true

  acts_as_tree
end
