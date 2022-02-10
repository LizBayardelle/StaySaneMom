class SubcategorizationBlog < ApplicationRecord
  belongs_to :subcategory
  belongs_to :blog
end
