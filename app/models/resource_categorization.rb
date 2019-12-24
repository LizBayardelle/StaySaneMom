class ResourceCategorization < ApplicationRecord
  belongs_to :resource
  belongs_to :subcategory
end
