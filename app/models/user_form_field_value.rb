class UserFormFieldValue < ActiveRecord::Base
  acts_as_list scope: :user_form_field

  belongs_to :user_form_field, inverse_of: :available_values

  delegate :type, to: :user_form_field, allow_nil: true
end
