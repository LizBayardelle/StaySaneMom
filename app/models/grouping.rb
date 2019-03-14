class Grouping < ApplicationRecord
  has_many :variations, through: :variation_groupings
end
