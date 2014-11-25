module Admin
  class MenuElementsController < Admin::ApplicationController
    expose(:menu_elements, model: DynamicMenu::ElementTypes::MenuElement)
    expose(:menu_element, attributes: :menu_element_params, model: DynamicMenu::ElementTypes::MenuElement)

    private

    def menu_element_params
      params.require(:menu_element).permit(:name, :menu_element_type)
    end
  end
end