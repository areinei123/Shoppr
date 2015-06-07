class GroceryList < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :group
  has_many :supplies
end
