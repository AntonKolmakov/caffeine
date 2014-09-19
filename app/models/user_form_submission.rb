class UserFormSubmission < ActiveRecord::Base
  belongs_to :user_form

  serialize :field_values, Hash

  validate :field_required?

  delegate :user_form_fields, to: :user_form

  protected

  def field_required?
    user_form_fields.each_with_index do |field, index|
      errors.add(:base, "Can't be blank" ) if field.required? && field_values[index]
    end
  end
end
