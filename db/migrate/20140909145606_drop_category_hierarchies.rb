class DropCategoryHierarchies < ActiveRecord::Migration[5.0]
  def up
    drop_table :category_hierarchies
  end

  def down
    create_table :category_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false   # ID of the parent/grandparent/great-grandparent/... tag
      t.integer  :descendant_id, :null => false # ID of the target tag
      t.integer  :generations, :null => false   # Number of generations between the ancestor and the descendant. Parent/child = 1, for example.
    end

    # For "all progeny of…" and leaf selects:
    add_index :category_hierarchies, [:ancestor_id, :descendant_id, :generations],
              :unique => true, :name => "tag_anc_desc_udx"

    # For "all ancestors of…" selects,
    add_index :category_hierarchies, [:descendant_id],
              :name => "tag_desc_idx"
  end
end
