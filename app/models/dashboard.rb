class Dashboard < ApplicationRecord
  enum category: [:medicine, :eat, :misc]
  # validations
  validates :title, presence: true
  validates_presence_of :finished_at, if: Proc.new { |a| a.eat? || a.misc? }
  validates_presence_of :started_at, if: Proc.new { |a| a.medicine? }, on: :parent
  validates_presence_of :parent_sign, if: Proc.new { |a| a.medicine? }
  #relationship
  belongs_to :child
  mount_uploader :parent_sign, ParentSignUploader
  mount_uploader :admin_sign, AdminSignUploader
end
