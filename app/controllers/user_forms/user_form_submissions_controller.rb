module UserForms
  class UserFormSubmissionsController < ApplicationController
    responders :flash, :location

    expose(:user_form)
    expose(:user_form_submissions, ancestor: :user_form)
    expose(:user_form_submission, attributes: :submission_params)

    def create
      user_form_submission.save

      respond_with user_form_submission, location: root_path
    end

    def new
    end

    private

    def submission_params
      params.require(:user_form_submission).permit.tap do |whitelisted|
        whitelisted[:field_values] = params[:user_form_submission][:field_values]
      end
    end
  end
end
