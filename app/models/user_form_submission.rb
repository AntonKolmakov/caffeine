class UserFormSubmission < ActiveRecord::Base
  belongs_to :user_form
  has_many :field_values, class_name: 'UserFormSubmissionFieldValue'

  delegate :user_form_fields, to: :user_form

  accepts_nested_attributes_for :field_values

  after_initialize :populate_with_field_values

  validate :field_required?

  def field_value(field)
    field_values.where(field: field)
  end

  protected

  def populate_with_field_values
    user_form_fields.each do |field|
      field_values.build(user_form_field: field)
    end
  end

  def field_required?
    user_form_fields.each_with_index do |field, index|
      errors.add(:base, "Can't be blank" ) if field.required? && field_values[index+1].value.empty?
      end
  end
end
