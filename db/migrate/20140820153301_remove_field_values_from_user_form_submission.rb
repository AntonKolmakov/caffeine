class RemoveFieldValuesFromUserFormSubmission < ActiveRecord::Migration
  def change
    change_table :user_form_submissions do |t|
      reversible do |dir|
        dir.up do
          t.remove :field_values
        end

        dir.down do
          t.text :field_values
        end
      end
    end
  end
end
