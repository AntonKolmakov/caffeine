class Post < ActiveRecord::Base
  extend FriendlyId

  belongs_to :category
  has_many :post_attachments

  enum status: %i(draft published blocked)

  validates :name, presence: true

  friendly_id :name, use: %i(slugged history)

  def should_generate_new_friendly_id?
    name_changed? || slug_changed?
  end
end
