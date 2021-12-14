class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable_on :tags

  belongs_to :user
  has_many :subcategorizations
  has_many :subcategories, through: :subcategorizations
  belongs_to :freebie, optional: true

  has_many :categorization_blogs
  has_many :categories, through: :categorization_blogs



  has_one_attached :image
  has_many_attached :pin_image
  has_one_attached :pdf

  searchkick text_start: [:title], suggest: [:title]

  def search_data
    {
      title: title,
      teaser: teaser,
      body: body,
      tag_list: tag_list
    }
  end
end
