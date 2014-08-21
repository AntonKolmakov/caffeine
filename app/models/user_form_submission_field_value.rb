class UserFormSubmissionFieldValue < ActiveRecord::Base
  belongs_to :user_form_submission
  belongs_to :user_form_field
end
