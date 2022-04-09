class Subcategory < ApplicationRecord
  # belongs_to :category

  has_many :subcategorization_blogs, dependent: :delete_all
  has_many :blogs, through: :subcategorization_blogs, dependent: :delete_all

  has_many :subcategorization_freebies, dependent: :delete_all
  has_many :freebies, through: :subcategorization_freebies, dependent: :delete_all

  has_many :subcategorization_solutions, dependent: :delete_all
  has_many :solutions, through: :subcategorization_solutions, dependent: :delete_all
end
