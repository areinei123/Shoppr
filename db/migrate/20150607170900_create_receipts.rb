class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :photo
      t.integer :membership_id
      t.integer :grocery_list_id
    end
  end
end
