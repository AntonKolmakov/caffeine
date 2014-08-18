class Category < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true

  acts_as_tree
end
