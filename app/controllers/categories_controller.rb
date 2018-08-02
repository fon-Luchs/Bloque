class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(category: params[:id])
    @article  = @category.articles
  end

  def destroy
    @category = Category.find(params[:id])
  end

end
