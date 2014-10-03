class UserFormSubmission < ActiveRecord::Base
  belongs_to :user_form
  has_many :field_values, class_name: 'UserFormSubmissionFieldValue', dependent: :destroy

  delegate :user_form_fields, to: :user_form

  accepts_nested_attributes_for :field_values

  # We build form field values for each instance of this form submission
  after_initialize :build_user_form_fields, if: ->(s) { s.new_record? }

  # But we should reject all those instantiated empty fields when we save submission
  # to prevent duplicated records
  before_create { field_values.delete(field_values.select { |f| f.field_value.nil? }) }

  def field_value(field)
    field_values.where(field: field)
  end

  private

  def build_user_form_fields
    user_form_fields.each do |field|
      field_values.build(user_form_field: field)
    end
  end
end
