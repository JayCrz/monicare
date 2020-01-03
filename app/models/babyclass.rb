class Babyclass < ApplicationRecord
  has_many :children
  has_many :class_teachers
  has_many :teachers, through: :class_teachers
end
