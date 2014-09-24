module Casein
  class UserFormsController < AdminApplicationController
    expose(:user_forms) { UserForm.order(sort_order(:name)).paginate(page: params[:page]) }
    expose(:user_form, attributes: :user_form_params)

    def index
      @casein_page_title = 'User forms'
    end

    def edit
      @casein_page_title = 'View user form'
    end

    def new
      @casein_page_title = 'Add a new user form'
      user_form.user_form_fields.build
    end

    def create
      user_form.save
      respond_with(:casein, user_form)
    end

    def update
      user_form.save
      respond_with(:casein, user_form)
    end

    def destroy
      user_form.destroy
      respond_with(:casein, user_form)
    end

    private

    def user_form_params
      params.require(:user_form).permit(:name,
        :email,
        :page_id
      ).merge(user_form_fields_attributes)
    end

    def user_form_fields_attributes
      params.require(:user_form)
        .permit(user_form_fields_attributes: [
          :id,
          :_destroy,
          :name,
          :field_type,
          :required,
          :show_in_admin_table,
          available_values_attributes: %i(id value _destroy)])
    end
  end
end
