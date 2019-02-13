class Capsule < ApplicationRecord
  belongs_to :user
  has_many :capsule_items
end
