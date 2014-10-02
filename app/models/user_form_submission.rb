class UserFormSubmission < ActiveRecord::Base
  belongs_to :user_form
  has_many :field_values, class_name: 'UserFormSubmissionFieldValue', dependent: :destroy

  delegate :user_form_fields, to: :user_form

  accepts_nested_attributes_for :field_values

  def field_value(field)
    field_values.where(field: field)
  end
end
