class RenameValueToDataInUserFormSubmissionFieldValue < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_form_submission_field_values, :value, :data
  end
end
