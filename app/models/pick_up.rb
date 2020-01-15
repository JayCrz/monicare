class PickUp < ApplicationRecord
  # validations
  validates :name, :pick_up_pic, :relationship, presence: true
  # relationship
  belongs_to :child
  mount_uploader :pick_up_pic, AvatarRelativeUploader
end
