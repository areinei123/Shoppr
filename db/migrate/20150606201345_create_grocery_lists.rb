class CreateGroceryLists < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
      t.string :name, null: false
      t.integer :group_id, null: false
    end
  end
end
