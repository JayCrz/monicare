class Child < ApplicationRecord
  belongs_to :babyclass
  has_many :child_teachers
  has_many :pick_ups
  has_many :teachers, through: :child_teachers
  belongs_to :user
  has_many :dashboards
  mount_uploader :child_pic, AvatarChildUploader
end
