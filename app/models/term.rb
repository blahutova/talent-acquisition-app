class Term < ApplicationRecord
  belongs_to :query
  belongs_to :category
end
