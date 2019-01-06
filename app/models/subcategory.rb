class Subcategory < ApplicationRecord
  has_many :subcategorizations
  has_many :blogs, through: :subcategorizations
end
