class Receipt < ActiveRecord::Base
  mount_uploader :photo, ReceiptPhotoUploader
  belongs_to :membership
  belongs_to :grocery_list

  def uploaded_by
    membership.user.full_name
  end
end
