class SeoDatum < ActiveRecord::Base
  belongs_to :datable, polymorphic: true

  has_paper_trail
end
