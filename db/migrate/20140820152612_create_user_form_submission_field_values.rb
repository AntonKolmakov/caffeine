class CreateUserFormSubmissionFieldValues < ActiveRecord::Migration
  def change
    create_table :user_form_submission_field_values do |t|
      t.belongs_to :user_form_submission
      t.belongs_to :user_form_field

      t.timestamps
    end

    add_index :user_form_submission_field_values, :user_form_submission_id,
      name: 'index_submission_field_values_on_user_form_submission_id'

    add_index :user_form_submission_field_values, :user_form_field_id,
      name: 'index_submission_field_values_on_user_form_field_id'
  end
end
