class Query < ApplicationRecord
  has_many :terms
  has_many :categories, through: :terms
  has_many :query_languages
  has_many :languages, through: :query_languages
  belongs_to :user

  def expanded_query_linkedin
    if text_of_query.blank?
      # expanded_query = ""
      # and_terms = Array.new
      # or_terms = Array.new
      # not_terms = Array.new
      #
      # terms.each do |term|
      #   if term.operator == "AND"
      #     and_terms << term
      #   elsif term.operator == "OR"
      #     or_terms << term
      #   else
      #     not_terms << term
      #   end
      # end
      #
      # and_terms.each do |ands|
      #   expanded_query += "("
      #
      # end
      #
      #
    else
      splitted_query = text_of_query.split("'")
      expanded_query = ""
      splitted_query.each do |part_of_query|
        was_category = false;
        categories.each do |category|
          if part_of_query == category.name
            was_category = true;
            expanded_query += category.category_query
          end
        end
        if was_category == false
          expanded_query += part_of_query
        end
      end
    end
    expanded_query
  end

  def categories_for_complex_query
    splitted_query = text_of_query.split("'")
    all_categories = Category.all
    all_categories_names = Array.new
    categories_for_query = Array.new
    all_categories.each do |category|
      all_categories_names << category.name
    end
    splitted_query.each do |part_of_query|
      if all_categories_names.include? part_of_query
        category = Category.find_by(name: part_of_query)
        if (!categories.include? category)
          categories_for_query << category
        end
      end
    end
    categories_for_query
  end

end
