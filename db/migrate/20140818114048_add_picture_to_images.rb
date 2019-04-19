class AddPictureToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :picture, :string
  end
end
