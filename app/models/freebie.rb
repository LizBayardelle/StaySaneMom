class Freebie < ApplicationRecord
  has_many :blogs
  has_one_attached :image
  has_one_attached :sample_image
  has_one_attached :t1_image
  extend FriendlyId
  friendly_id :name, use: :slugged
end
