class Dashboard < ApplicationRecord
  enum category: [:medicine, :eat, :misc]
  belongs_to :child
  has_many :notifications, dependent: :destroy
  mount_uploader :parent_sign, ParentSignUploader
  mount_uploader :admin_sign, AdminSignUploader
end
