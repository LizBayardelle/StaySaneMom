class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :blog, optional: true, counter_cache: true
  has_many :responses
end
