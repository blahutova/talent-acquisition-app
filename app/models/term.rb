class Term < ApplicationRecord
  belongs_to :query
  belongs_to :category

  def category_name
    category.name
  end
end
