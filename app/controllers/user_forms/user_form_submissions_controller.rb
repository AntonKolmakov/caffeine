module UserForms
  class UserFormSubmissionsController < ApplicationController
    responders :flash
    respond_to :js, only: :create

    expose(:user_form)
    expose(:user_form_submissions, ancestor: :user_form)
    expose(:user_form_submission, attributes: :submission_params)

    def create
      UserFormSubmissionMailer.form_submitted(user_form_submission).deliver if user_form_submission.save
      respond_with user_form_submission
    end

    private

    def submission_params
      params.require(:user_form_submission).permit(
        field_values_attributes: [
          :id, :field_value, :user_form_field_id, field_value: []])
    end
  end
end
