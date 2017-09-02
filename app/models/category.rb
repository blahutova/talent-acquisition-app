class Category < ApplicationRecord
  has_many :terms
  has_many :queries, through: :terms
  has_many :translations
  has_many :languages, through: :translations
end
