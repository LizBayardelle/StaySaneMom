class Freebie < ApplicationRecord
  has_many :blogs
  has_one_attached :image
  has_one_attached :sample_image
  has_one_attached :t1_image
  has_one_attached :fb_share_image
  has_many_attached :pin_image
  belongs_to :subcategory

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :categorization_freebies
  has_many :categories, through: :categorization_freebies

  has_many :subcategorization_freebies
  has_many :subcategories, through: :subcategorization_freebies
end
