class Translation < ApplicationRecord
  belongs_to :language
  belongs_to :category
end
