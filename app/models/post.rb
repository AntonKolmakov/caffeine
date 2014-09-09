class Post < ActiveRecord::Base
  include Sluggable

  belongs_to :category
  has_many :post_attachments

  enum status: %i(draft published blocked)

  validates :name, presence: true
end
