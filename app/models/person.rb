class Person < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :occasions

  def full_name
    "#{last_name}, #{first_name}"
  end
end
