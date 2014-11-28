module Admin
  class MenuElementsController < Admin::ApplicationController
    expose(:menu_elements, model: DynamicMenu::ElementTypes::Base)
    expose(:menu_element, attributes: :element_types_params, model: DynamicMenu::ElementTypes::Base)

    def create
      menu_element.save
      respond_with :admin, menu_element, location: -> { edit_admin_menu_element_path(menu_element) }
    end

    def update
      menu_element.save
      respond_with :admin, menu_element, location: -> { edit_admin_menu_element_path(menu_element) }
    end

    private

    def element_types_params
      params.require(:dynamic_menu_element_types).permit(:title, :album_id, :page_id, :css, :url, :type)
    end
  end
end
