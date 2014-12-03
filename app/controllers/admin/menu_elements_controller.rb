module Admin
  class MenuElementsController < Admin::ApplicationController
    expose(:menu_elements, model: DynamicMenu::ElementTypes::Base)
    expose(:menu_element, attributes: :element_types_params, model: DynamicMenu::ElementTypes::Base)

    def create
      menu_element.current_step = session[:order_step]
      multi_step_action
      if menu_element.new_record?
        render 'new'
      else
        session[:order_step] = nil
        respond_with :admin, menu_element, location: -> { edit_admin_menu_element_path(menu_element) }
      end
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

    def multi_step_action
      if menu_element.valid?
        if params[:back_button]
          menu_element.previous_step
        elsif menu_element.last_step?
          menu_element.save
        else
          menu_element.next_step
        end
        session[:order_step] = menu_element.current_step
      end
    end
  end
end
