class Category < ApplicationRecord
  before_save { self.name = name.capitalize }
  has_many :terms
  has_many :queries, through: :terms
  has_many :translations
  has_many :languages, through: :translations

  validates :name, presence: true, length: { in: 2..30  }, uniqueness: { case_sensitive: false }
end
