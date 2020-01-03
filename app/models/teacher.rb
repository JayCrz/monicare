class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
        :rememberable,
        :validatable
  has_many :class_teachers
  has_many :babyclasses, through: :class_teachers
  has_many :child_teachers
  has_many :children, through: :child_teachers
end
