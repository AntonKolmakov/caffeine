module Admin
  class UserFormsController < AdminsController
    expose(:user_forms)
    expose(:user_form, attributes: :user_form_params)

    def index
    end

    def edit
    end

    def new
      user_form.user_form_fields.build
    end

    def create
      user_form.save
      respond_with(:admin, user_form)
    end

    def update
      user_form.save
      respond_with(:admin, user_form)
    end

    def destroy
      user_form.destroy
      respond_with(:admin, user_form)
    end

    private

    def user_form_params
      params.require(:user_form).permit(:name,
        :email,
        :page_id,
        :alias
      ).merge(user_form_fields_attributes.to_hash)
    end

    def user_form_fields_attributes
      params.require(:user_form)
        .permit(user_form_fields_attributes: [
          :id,
          :_destroy,
          :position,
          :name,
          :field_type,
          :required,
          :show_in_admin_table,
          available_values_attributes: %i(id value _destroy)])
    end
  end
end
