module DynamicMenu
  module ElementTypes
    class Base < ActiveRecord::Base
      MENU_ELEMENT_TYPES = {
        link: 'DynamicMenu::ElementTypes::Link',
        page: 'DynamicMenu::ElementTypes::Page',
        album: 'DynamicMenu::ElementTypes::Album',
        divider: 'DynamicMenu::ElementTypes::Divider'
      }

      self.table_name = 'menu_elements'
    end
  end
end
