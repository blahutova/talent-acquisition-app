class Language < ApplicationRecord
  before_save { self.name = name.capitalize }
  has_many :query_languages
  has_many :queries, through: :query_languages
  has_many :translations
  has_many :categories, through: :translations
  validates :name, presence: true, length: { in: 2..30  }, uniqueness: { case_sensitive: false }
end
