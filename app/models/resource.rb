class Resource < ApplicationRecord

  belongs_to :user
  has_many :blogs
  has_many :subscribers

  has_one_attached :document
  has_one_attached :sample

  has_many :resource_categorizations
  has_many :subcategories, through: :resource_categorizations

end
