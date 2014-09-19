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
      params.require(:user_form_submission).permit!
    end
  end
end
