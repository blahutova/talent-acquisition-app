class Query < ApplicationRecord
  has_many :terms
  has_many :categories, through: :terms
  has_many :query_languages
  has_many :languages, through: :query_languages
  belongs_to :user
end
