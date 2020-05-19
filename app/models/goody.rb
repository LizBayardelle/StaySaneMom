class Goody < ApplicationRecord
  has_many :variations
  has_many_attached :images

  include RailsSortable::Model
  set_sortable :sort
end
