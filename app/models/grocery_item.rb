class GroceryItem < ActiveRecord::Base
  validates :name, presence: true
  validates :quantity, presence: true

  belongs_to :grocery_list
end
