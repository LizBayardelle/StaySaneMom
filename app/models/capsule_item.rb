class CapsuleItem < ApplicationRecord
  belongs_to :user
  belongs_to :capsule
  has_one_attached :photo
end
