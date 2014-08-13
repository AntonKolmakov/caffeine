class Category < ActiveRecord::Base
  has_many :posts

  acts_as_tree
end
