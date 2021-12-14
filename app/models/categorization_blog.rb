class CategorizationBlog < ApplicationRecord
  belongs_to :category
  belongs_to :blog
end
