class PlannerCustom < ApplicationRecord
  belongs_to :purchase
  belongs_to :user
  has_many_attached :logos
  has_many_attached :doodles
end
