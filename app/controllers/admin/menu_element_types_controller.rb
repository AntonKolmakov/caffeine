module Admin
  class MenuElementTypesController < Admin::ApplicationController
    expose(:element_types, model: DynamicMenu::ElementTypes::Base)
    expose(:element_type, attributes: :element_types_params, model: DynamicMenu::ElementTypes::Base)

    def create
      element_type.save
      respond_with :admin, element_type, location: -> { edit_admin_menu_element_type_path(element_type) }
    end

    def update
      element_type.save
      respond_with :admin, element_type, location: -> { edit_admin_menu_element_type_path(element_type) }
    end

    private

    def element_types_params
      params.require(:dynamic_menu_element_types).permit(:title, :album_id, :page_id, :css, :url, :type)
    end
  end
end
