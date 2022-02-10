class Subcategory < ApplicationRecord
  belongs_to :category
  has_one :freebie

  has_many :subcategorization_blogs
  has_many :blogs, through: :subcategorization_blogs

  has_many :subcategorization_freebies
  has_many :freebies, through: :subcategorization_freebies

  has_many :subcategorization_solutions
  has_many :solutions, through: :subcategorization_solutions

end
