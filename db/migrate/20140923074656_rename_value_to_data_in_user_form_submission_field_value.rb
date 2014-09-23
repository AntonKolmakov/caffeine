class RenameValueToDataInUserFormSubmissionFieldValue < ActiveRecord::Migration
  def change
    rename_column :user_form_submission_field_values, :value, :data
  end
end
