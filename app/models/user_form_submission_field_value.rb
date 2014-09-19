class UserFormSubmissionFieldValue < ActiveRecord::Base
  belongs_to :user_form_submission
  belongs_to :user_form_field

  delegate :field_type, to: :user_form_field

  scope :admin_table_showable, -> { joins(:user_form_field).where('user_form_fields.show_in_admin_table = true') }

  serialize :value, JSON
end
