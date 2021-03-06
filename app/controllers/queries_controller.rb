class QueriesController < ApplicationController

  def index
    user = current_user
    if !user.blank?
      @queries = user.queries
    else
      render html: "404 - Page not found"
    end

  end

  def show
    #text.scan(/'([^']*)'/)
    if Query.exists?(params[:id])
      @query = Query.find(params[:id])
      if @query.text_of_query.blank?
        @type_of_query = "simple"
        @terms = @query.terms
        @and_terms = Array.new
        @or_terms = Array.new
        @none_terms = Array.new

        @terms.each do |t|
          if t.operator == "AND"
            @and_terms << t
          elsif t.operator == "OR"
            @or_terms << t
          else
            @none_terms << t
          end
        end

      else
        @terms = @query.terms
        @type_of_query = "complex"
      end
  else
      render html: "404 - Page not found"
  end
  end

  def edit
    @query = Query.find(params[:id])
    if @query.text_of_query.blank?
      @type_of_query = "simple"
      @terms = @query.terms
      @all_categories = Category.all
      @term_for_query = @query.terms.build
      @term_for_delete = @query.terms.build

      @and_terms = Array.new
      @or_terms = Array.new
      @none_terms = Array.new
      @and_fordelete_categories = Array.new
      @or_fordelete_categories = Array.new
      @none_fordelete_categories = Array.new

      @terms.each do |t|
        if t.operator == "AND"
          @and_terms << t
          @and_fordelete_categories << t.category
        elsif t.operator == "OR"
          @or_terms << t
        elsif t.operator == "NOT"
          @none_terms << t
        end
      end
    else
      @type_of_query = "complex"
    end
  end

  def update
    @query = Query.find(params[:id])

    if @query.text_of_query.blank?
      params[:and_categories][:id].each do |category|
        if !category.empty?
          @query.terms.build(:category_id => category, operator: "AND")
        end
      end

      params[:or_categories][:id].each do |category|
        if !category.empty?
          @query.terms.build(:category_id => category, operator: "OR")
        end
      end

      params[:not_categories][:id].each do |category|
        if !category.empty?
          @query.terms.build(:category_id => category, operator: "NOT")
        end
      end

      params[:and_delete_terms][:id].each do |del_and_term|
         if !del_and_term.empty?
          #term_id = Category.find(:category_id => category).term
          @query.terms.destroy(del_and_term)
          # category.terms.delete(@term)
         end
      end

      params[:or_delete_terms][:id].each do |del_or_term|
         if !del_or_term.empty?
          #term_id = Category.find(:category_id => category).term
          @query.terms.destroy(del_or_term)
          # category.terms.delete(@term)
         end
      end

      params[:none_delete_terms][:id].each do |del_none_term|
         if !del_none_term.empty?
          #term_id = Category.find(:category_id => category).term
          @query.terms.destroy(del_none_term)
          # category.terms.delete(@term)
         end
      end
    else
      #TODO
      @query.categories.clear
      # term = Term.create
      # term.query = @query
      # @query.categories_for_complex_query.each do |category|
      #   term = Term.create
      #   term.query = @query
      #   term.category = category
      # end
      new_text_of_query = params[:query][:text_of_query]
      @query.categories << categories_for_complex_query(@query, new_text_of_query)
      print "TEST"
      print @query.categories
    end

    if @query.update_attributes(query_params)
      redirect_to(:action => 'show', :id => @query.id)
    else
      render 'edit'
    end
  end

  def new
    @query = Query.new
    @all_categories = Category.all
  end

  def create
    @query = Query.new(query_params)
    @query.user = current_user

    if @query.text_of_query.blank?
      params[:and_categories][:id].each do |category|
        if !category.empty?
          @query.terms.build(:category_id => category, operator: "AND")
        end
      end

      params[:or_categories][:id].each do |category|
        if !category.empty?
          @query.terms.build(:category_id => category, operator: "OR")
        end
      end

      params[:not_categories][:id].each do |category|
        if !category.empty?
          @query.terms.build(:category_id => category, operator: "NOT")
        end
      end
    else
      new_text_of_query = params[:query][:text_of_query]
      @query.categories << categories_for_complex_query(@query, new_text_of_query)
    end

    if @query.save
      redirect_to '/queries'
    else
      render 'new'
    end
  end

  def destroy
    Query.find(params[:id]).destroy
    flash[:success] = "Query deleted"
    redirect_to queries_path
  end

  private
  def query_params
    params.require(:query).permit(:name, :text_of_query)
  end

  private
  def categories_for_complex_query(query, new_text_of_query)
    splitted_query = new_text_of_query.split("'")
    categories = query.categories
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
