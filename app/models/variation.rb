class Variation < ApplicationRecord
  belongs_to :goody
  has_many :groupings, through: :variation_groupings
  has_many_attached :images
  has_many_attached :downloadable_files
  has_many :basket_items
  has_many :blogs

  include RailsSortable::Model
  set_sortable :sort

  default_scope { where(active: true) }
end
