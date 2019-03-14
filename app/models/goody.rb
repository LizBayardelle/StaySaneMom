class Goody < ApplicationRecord
  has_many :variations
  has_many_attached :images
end
