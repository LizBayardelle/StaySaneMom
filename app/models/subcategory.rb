class Subcategory < ApplicationRecord
  has_many :subcategorizations
  has_many :blogs, through: :subcategorizations
  has_one_attached :image

end
