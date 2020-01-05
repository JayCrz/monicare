class Dashboard < ApplicationRecord
  enum category: [:medicine, :eat, :misc]
  belongs_to :child
  mount_uploader :parent_sign, ParentSignUploader
  mount_uploader :admin_sign, AdminSignUploader
end
