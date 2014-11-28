module DynamicMenu
  class MenuElement < ActiveRecord::Base
    belongs_to :menu_element_type, class_name: 'DynamicMenu::ElementTypes::Base'
  end
end
