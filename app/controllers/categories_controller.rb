class CategoriesController < ApplicationController

  def index
      @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @translations = @category.translations
    added_languages = @category.languages
    @languages_for_add = Array.new
    languages = Language.all
    languages.each do |language|
      if (!added_languages.include? language)
        @languages_for_add << language
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to(:action => 'show', :id => @category.id)
    else
      render 'edit'
    end

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to '/categories'
    else
      render 'new'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :category_query)
  end

end
