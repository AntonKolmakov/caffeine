class Post < ActiveRecord::Base
  extend FriendlyId

  belongs_to :category

  validates :name, presence: true

  friendly_id :name, use: %i(slugged history)

  def should_generate_new_friendly_id?
    name_changed? || slug_changed? unless fix_slug? && slug.present?
  end
end
