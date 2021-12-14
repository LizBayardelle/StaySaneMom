class Category < ApplicationRecord
  has_many :categorization_blogs
  has_many :blogs, through: :categorization_blogs

  has_many :categorization_freebies
  has_many :freebies, through: :categorization_freebies

  has_many :categorization_solutions
  has_many :solutions, through: :categorization_solutions
end
