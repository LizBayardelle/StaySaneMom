class Resource < ApplicationRecord

  belongs_to :user

  has_many :resource_categorizations
  has_many :subcategories, through: :resource_categorizations

end
