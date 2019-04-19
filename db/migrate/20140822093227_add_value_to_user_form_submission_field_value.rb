class AddValueToUserFormSubmissionFieldValue < ActiveRecord::Migration[5.0]
  def change
    add_column :user_form_submission_field_values, :value, :text
  end
end
