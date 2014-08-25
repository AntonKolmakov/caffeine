class Post < ActiveRecord::Base
  extend FriendlyId

  belongs_to :category

  validates :name, presence: true

  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || changed_attributes['name'].present?
  end
end
