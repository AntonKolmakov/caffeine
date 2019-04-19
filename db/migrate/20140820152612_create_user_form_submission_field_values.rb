class CreateUserFormSubmissionFieldValues < ActiveRecord::Migration[5.0]
  def change
    create_table :user_form_submission_field_values do |t|
      t.references :user_form_submission, index: {  name: 'index_submission_field_values_on_user_form_submission_id' }
      t.references :user_form_field, index: { name: 'index_submission_field_values_on_user_form_field_id' }

      t.timestamps
    end
  end
end
