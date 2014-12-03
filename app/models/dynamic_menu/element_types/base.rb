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
      attr_writer :current_step

      validates :title, :type, presence: true

      def current_step
        @current_step || steps.first
      end

      def steps
        %w(selecting filling)
      end

      def next_step
        self.current_step = steps[steps.index(current_step)+1]
      end

      def previous_step
        self.current_step = steps[steps.index(current_step)-1]
      end

      def first_step?
        current_step == steps.first
      end

      def last_step?
        current_step == steps.last
      end
    end
  end
end
