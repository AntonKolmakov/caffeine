class UserFormSubmission < ActiveRecord::Base
  belongs_to :user_form

  serialize :field_values, Hash

  delegate :user_form_fields, to: :user_form
end
