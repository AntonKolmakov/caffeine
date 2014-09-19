class UserFormSubmission < ActiveRecord::Base
  belongs_to :user_form
  has_many :field_values, class_name: 'UserFormSubmissionFieldValue'

  delegate :user_form_fields, to: :user_form

  accepts_nested_attributes_for :field_values

  after_initialize :populate_with_field_values

  def field_value(field)
    field_values.where(field: field)
  end

  protected

  def populate_with_field_values
    user_form_fields.each do |field|
      self.field_values.build(user_form_field: field)
    end
  end
end
