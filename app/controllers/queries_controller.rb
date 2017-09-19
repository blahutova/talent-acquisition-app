class QueriesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @queries = @user.queries
  end

  def show
    @query = Query.find(params[:id])
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
    #@terms = @query.terms
  end

  def edit
    @query = Query.find(params[:id])
    if @query.text_of_query == ""
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

    # params[:and_delete_categories][:id].each do |del_and_category|
    #   print "bahahaha"
    #   print del_and_category
    #    if !del_and_category.empty?
    #     #term_id = Category.find(:category_id => category).term
    #     print "bahahaha"
    #     print del_and_category
    #     @term = Term.find_by(:category_id => del_and_category)
    #     print "toto bude term"
    #     print @term.id
    #     @query.terms.destroy(@term)
    #     # category.terms.delete(@term)
    #    end
    # end

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

    if @query.update_attributes(query_params)
      redirect_to(:action => 'show', :id => @query.id)
    else
      render 'edit'
    end
  end

  def destroy
    Term.find(params[:id]).destroy
    # flash[:success] = "Category from query deleted"
    # redirect_to users_url
  end

  private
  def query_params
    params.require(:query).permit(:name, :text_of_query)
  end

end
