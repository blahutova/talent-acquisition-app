class LanguagesController < ApplicationController

  def index
    @languages = Language.all
  end

  def show
    @language = Language.find(params[:id])
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(language_params)
      redirect_to(:action => 'show', :id => @language.id)
    else
      render 'edit'
    end
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      redirect_to '/languages'
    else
      render 'new'
    end
  end

  def destroy
    Language.find(params[:id]).destroy
    flash[:success] = "Language deleted"
    redirect_to languages_path
  end

  private
  def language_params
    params.require(:language).permit(:name)
  end

end
