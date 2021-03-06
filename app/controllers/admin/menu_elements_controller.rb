module Admin
  class MenuElementsController < Admin::ApplicationController
    respond_to :js, only: :new

    expose(:menu_elements) { DynamicMenu::ElementTypes::Base.all }
    expose(:menu_element, model: DynamicMenu::ElementTypes::Base)

    def create
      menu_element.save
      respond_with :admin, menu_element, location: -> { edit_admin_menu_element_path(menu_element) }
    end

    def update
      menu_element.save
      respond_with :admin, menu_element, location: -> { edit_admin_menu_element_path(menu_element) }
    end

    def destroy
      menu_element.destroy
      respond_with :admin, menu_element, location: -> { admin_menu_elements_path }
    end

    private

    def element_types_params
      params.require(:dynamic_menu_element_types).permit(:title, :album_id, :page_id, :css, :url, :type)
    end
  end
end
