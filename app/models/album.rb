class Album < ActiveRecord::Base
  belongs_to :page
  has_many :images, -> { order 'position' }

  validates :name, presence: true

  acts_as_tree
end
