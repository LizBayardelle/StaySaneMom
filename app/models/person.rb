class Person < ApplicationRecord
  # Relations
  belongs_to :user
  has_many :gifts
  has_many :occasions, through: :gifts

  def full_name
    "#{last_name}, #{first_name}"
  end
end
