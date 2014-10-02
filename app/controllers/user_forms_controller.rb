class UserFormsController < ApplicationController
  expose(:user_form)
  expose(:user_form_submission) { user_form.user_form_submissions.build }

  def show
    user_form_submission.user_form_fields.each do |field|
      user_form_submission.field_values.build(user_form_field: field)
    end
  end
end
