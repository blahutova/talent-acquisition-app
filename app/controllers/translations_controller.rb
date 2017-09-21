class TranslationsController < ApplicationController

  def new
    @translation = Translation.new
    @translation.category = Category.find(params[:category_id])
    @translation.language = Language.find(params[:language_id])
  end

  def create
    @translation = Translation.new(translation_params)
    @translation.category = Category.find(params[:category_id])
    @translation.language = Language.find(params[:language_id])

    if @translation.save
      redirect_to '/categories'
    else
      render 'new'
    end
  end

  def edit
    @translation = Translation.find(params[:id])
  end

  def update
    @translation = Translation.find(params[:id])

    if @translation.update_attributes(translation_params)
    redirect_to '/categories'
    else
      render 'edit'
    end
  end

  def destroy
    Translation.find(params[:id]).destroy
    flash[:success] = "Translation deleted"
    redirect_to categories_path
  end


  private
  def translation_params
    params.require(:translation).permit(:translated_query)
  end

end
