class Variation < ApplicationRecord
  belongs_to :goody
  has_many :groupings, through: :variation_groupings
  has_many_attached :images
end
