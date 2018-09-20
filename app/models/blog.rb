class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :image
  has_one_attached :pdf
end
