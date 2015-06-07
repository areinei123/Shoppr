class Receipt < ActiveRecord::Base
  mount_uploader :photo, ReceiptPhotoUploader
end
