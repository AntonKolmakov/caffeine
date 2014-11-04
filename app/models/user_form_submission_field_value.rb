class UserFormSubmissionFieldValue < ActiveRecord::Base
  store :data, accessors: %i(field_value), coder: JSON

  belongs_to :user_form_submission
  belongs_to :user_form_field

  delegate :type, to: :user_form_field

  scope :admin_table_showable, -> { joins(:user_form_field).where('user_form_fields.show_in_admin_table = true') }

  def formatted_field_value
    user_form_field.formatted_value(field_value)
  end
end
