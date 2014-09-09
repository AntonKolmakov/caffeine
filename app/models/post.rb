class Post < ActiveRecord::Base
  include Sluggable

  belongs_to :category
  has_many :post_attachments

  validates :name, presence: true
end
