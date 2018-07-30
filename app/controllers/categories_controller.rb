class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  #############################################
  def create
    @category = Category.new(category_params)

    if @category.save
      puts"!!OK!!"
      redirect_to articles_new_path
    else
      raise"CTG_ERRNO"
      flash.now[:danger] = "error"
    end
  end
  #############################################

  def show
    @category = Category.find_by(name: params[:id])
    @article  = @category.articles
  end

  def destroy
    @category = Category.find(params[:id])
  end

  private

    def category_params
      params.require(:category).permit(:category)
    end
end
