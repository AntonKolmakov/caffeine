module DynamicMenu
  module ElementTypes
    class Base < ActiveRecord::Base
      MENU_ELEMENT_TYPES = %w(Link Page Album Devider)

      belongs_to :menu_element
    end
  end
end
