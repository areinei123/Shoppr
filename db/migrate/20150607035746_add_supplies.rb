class AddSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :item
      t.integer :grocery_list_id
    end
  end
end
