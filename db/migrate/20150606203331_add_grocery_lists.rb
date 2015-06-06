class AddGroceryLists < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
      t.string :name, null: false
      t.references :group, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
