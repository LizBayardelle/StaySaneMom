class Purchase < ApplicationRecord
  belongs_to :basket
  belongs_to :user, optional: true
  attr_accessor :purchase_id
end
