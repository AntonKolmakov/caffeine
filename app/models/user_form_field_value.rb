class UserFormFieldValue < ActiveRecord::Base
  belongs_to :user_form_field

  delegate :field_type, to: :user_form_field, allow_nil: true
end
