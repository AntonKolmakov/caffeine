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

    def set_type
      type =
          if params[:dynamic_menu_element_types_base]
            'base'
          elsif params[:dynamic_menu_element_types_link]
            'link'
          elsif params[:dynamic_menu_element_types_page]
            'page'
          elsif params[:dynamic_menu_element_types_album]
            'album'
          elsif params[:dynamic_menu_element_types_divider]
            'divider'
          end
      "dynamic_menu_element_types_#{type}"
    end

    def element_types_params
      params.require(set_type.to_sym).permit(:title, :album_id, :page_id, :css, :url, :type)
    end
  end
end
