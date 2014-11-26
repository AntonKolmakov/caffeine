module DynamicMenu
  class MenuElement < ActiveRecord::Base
    has_one :element_type, class_name: 'DynamicMenu::ElementTypes::Base'
  end
end
