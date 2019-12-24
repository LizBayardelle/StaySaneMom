class Subcategory < ApplicationRecord
  has_many :subcategorizations
  has_many :blogs, through: :subcategorizations

  has_one_attached :image

  has_many :resource_categorizations
  has_many :resources, through: :resource_categorizations


end
