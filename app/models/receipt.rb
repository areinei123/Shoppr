class Receipt < ActiveRecord::Base
  mount_uploader :photo, ReceiptPhotoUploader
  belongs_to :membership
  belongs_to :grocery_list

  validates :membership, presence: true
  validates :grocery_list, presence: true
  validates :photo, presence: true

  def uploaded_by
    membership.user.full_name
  end
end
