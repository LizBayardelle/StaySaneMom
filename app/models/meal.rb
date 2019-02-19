class Meal < ApplicationRecord
  belongs_to :user_id
  has_one_attached :image

end
