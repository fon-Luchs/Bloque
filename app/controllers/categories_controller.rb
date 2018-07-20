class CategoriesController < ApplicationController

  def create
    @article  = Article.find(params[:article_id])
    @category = Category.create(category_params)

      ## if !!
  end

  private

    def category_params
      params.require(:category).permit(:category)
    end
end
