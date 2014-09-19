module UserForms
  class UserFormSubmissionsController < ApplicationController
    responders :flash
    respond_to :js, only: :create

    expose(:user_form)
    expose(:user_form_submissions, ancestor: :user_form)
    expose(:user_form_submission, attributes: :submission_params)

    def create
      user_form_submission.save

      respond_with user_form_submission
    end

    def new
      user_form_submission.user_form_fields.each do |field|
        user_form_submission.field_values.build(user_form_field: field)
      end
    end

    private

    def submission_params
      params.require(:user_form_submission).permit(
        field_values_attributes:
          %i(value user_form_field_id))
    end
  end
end
