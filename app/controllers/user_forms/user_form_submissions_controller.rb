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

    private

    def submission_params
      params.require(:user_form_submission).permit(
        field_values_attributes:
          %i(value user_form_field_id))
    end
  end
end
