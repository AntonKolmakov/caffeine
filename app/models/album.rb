class Album < ActiveRecord::Base
  has_many :images, -> { order 'position' }

  validates :name, presence: true

  acts_as_tree
end
