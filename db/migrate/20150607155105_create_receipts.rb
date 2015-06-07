class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :img_url, null:false
      t.date :date
      t.integer :membership_id, null: false
      t.integer :grocery_list_id, null: false
    end
  end
end
