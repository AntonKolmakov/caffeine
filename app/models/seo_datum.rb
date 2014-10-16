class SeoDatum < ActiveRecord::Base
  belongs_to :datable, polymorphic: true
end
