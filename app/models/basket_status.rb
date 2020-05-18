class BasketStatus < ApplicationRecord
  has_many :baskets, dependent: :destroy
end
