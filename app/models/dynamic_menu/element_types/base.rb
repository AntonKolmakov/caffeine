module DynamicMenu
  module ElementTypes
    class Base < ActiveRecord::Base
      MENU_ELEMENT_TYPES = {
        link: 'DynamicMenu::ElementTypes::Link',
        page: 'DynamicMenu::ElementTypes::Page',
        album: 'DynamicMenu::ElementTypes::Album',
        divider: 'DynamicMenu::ElementTypes::Divider'
      }

      self.table_name = 'menu_element_types'

      has_many :menu_elements, class_name: 'DynamicMenu::MenuElement', foreign_key: 'menu_element_type_id'
    end
  end
end
