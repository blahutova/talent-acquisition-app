class Language < ApplicationRecord
  has_many :query_languages
  has_many :queries, through: :query_languages
  has_many :translations
  has_many :categories, through: :translations
end
