class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable_on :tags

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many_attached :pin_image
  has_one_attached :pdf

end
