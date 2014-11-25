module DynamicMenu
  module ElementTypes
    class MenuElement < ActiveRecord::Base
      has_one :base
    end
  end
end
