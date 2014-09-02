class Post < ActiveRecord::Base
  include Sluggable

  belongs_to :category

  validates :name, presence: true
end
