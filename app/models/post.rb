class Post < ActiveRecord::Base
  extend FriendlyId

  belongs_to :category

  validates :name, presence: true

  friendly_id :name, use: %i(slugged history)

  def should_generate_new_friendly_id?
    if fix_slug? && slug.present?
      false
    else
      name_changed? || slug_changed?
    end
  end
end
