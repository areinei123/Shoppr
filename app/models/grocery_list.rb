class GroceryList < ActiveRecord::Base
  validates :name, presence: true

  has_many   :grocery_items
  has_many   :receipts
  has_many   :supplies
  belongs_to :group
  has_many :supplies
end
