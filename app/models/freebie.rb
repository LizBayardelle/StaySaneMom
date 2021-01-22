class Freebie < ApplicationRecord
  has_many :blogs
  has_one_attached :image

end
