class Solution < ApplicationRecord
  has_one_attached :image
  has_one_attached :fb_share_image
  has_one_attached :t1_image
  has_many_attached :pin_image


  has_many :categorization_solutions
  has_many :categories, through: :categorization_solutions

  has_many :subcategorization_solutions
  has_many :subcategories, through: :subcategorization_solutions

end
