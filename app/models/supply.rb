class Supply < ActiveRecord::Base
  validates :item, presence: true

  belongs_to :grocery_list
end