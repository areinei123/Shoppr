class CreateGroceryItems < ActiveRecord::Migration
  def change
    create_table :grocery_items do |t|
      t.string :name, null: false
      t.date :expiration_date
      t.integer :quantity, null: false
      t.integer :grocery_list_id, null: false
    end
  end
end
