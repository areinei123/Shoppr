class Receipt < ActiveRecord::Base
  belongs_to :membership
  belongs_to :grocery_list

  validates :img_url, presence: true
end
