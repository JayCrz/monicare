class Dashboard < ApplicationRecord
  enum category: [:medicine, :eat, :misc]
  belongs_to :child
end
