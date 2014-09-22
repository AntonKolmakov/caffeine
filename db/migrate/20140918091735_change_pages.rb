class ChangePages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.belongs_to :album, index: true
    end
  end
end
