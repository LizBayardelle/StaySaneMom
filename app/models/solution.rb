class Solution < ApplicationRecord
  has_one_attached :image

  has_many :categorization_solutions
  has_many :categories, through: :categorization_solutions

end
