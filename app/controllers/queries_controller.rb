class QueriesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @queries = @user.queries
  end

  def show
    @user = User.find(params[:user_id])
    @queries = @user.queries
    @query = @queries.find(params[:id])
    #@query_to_display = @query.categories
    if @query.text_of_query == ""
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
      @type_of_query = "complex"
    end
    @terms = @query.terms
    #@empty = ""
    #if @guery.text_of_query == empty
    #  @query_to_display = @query.categories
    #else
    #  @query_to_display = @query.text_of_query
    #end
  end

end
