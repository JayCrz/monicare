class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :teacher
  belongs_to :child
end
