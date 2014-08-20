class UserFormSubmission < ActiveRecord::Base
  belongs_to :user_form

  serialize :field_values, Hash

  delegate :user_form_fields, to: :user_form

  def field_value(field_id)
    return unless field_values[field_id.to_s]

    UserFormField.find(field_id.to_i).decorate_value(field_values[field_id.to_s])
  end
end
