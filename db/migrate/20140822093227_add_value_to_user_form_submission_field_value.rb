class AddValueToUserFormSubmissionFieldValue < ActiveRecord::Migration
  def change
    add_column :user_form_submission_field_values, :value, :text
  end
end
