class Occasion < ApplicationRecord
  # Relations
  has_many :gifts, dependent: :destroy
  has_many :people, through: :gifts
  belongs_to :user
end
