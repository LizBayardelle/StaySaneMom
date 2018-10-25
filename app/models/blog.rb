class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable_on :tags
  after_save :set_published_on

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_one_attached :pin_image
  has_one_attached :pdf

  def set_published_on
    self.published_on = DateTime.now if self.published
  end
end
